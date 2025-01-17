<?php

namespace App\Http\Services;


use App\Http\Services\RoleAccountService;
use App\Models\AutoBank;
use Cookie;
use Illuminate\Support\Facades\Http;
use App\Http\Services\OrderService;

class AutoBankService

{
    public function __construct(AutoBank $object, BankService $bankService)
    {
        $this->object = $object;
        $this->bankService = $bankService;
    }

    public function getAll() {
        return $this->object->get();
    }

    public function getTransactions() {
        $bank = $this->bankService->getFirst();
        $shortName = $bank->shortName;
        $number = $bank->number;
        $token = $bank->token;
        $password = $bank->password;
        $link = 'https://api.web2m.com/historyapiacbv3/'.$password.'/'.$number.'/'.$token;
        $response = Http::get('https://api.web2m.com/historyapiacbv3/'.$password.'/'.$number.'/'.$token);

        return $response['transactions'];
    }

    public function filtTransactions() {
        $results = [];
        $transactions = $this->getTransactions();
        foreach ($transactions as $transaction) {
            if (str_contains($transaction['description'], 'ORDER')) {
                $transaction['order_id'] = $this->getIdFromDescription($transaction['description'], 'ORDER');
                array_push($results, $transaction);
            }
        }
        return $results;
    }


    public function checkTransaction($order_id, $transactionNumber) {
        $auto_bank = $this->object->where('order_id', $order_id)->where('transactionNumber', $transactionNumber)->first();
        return $auto_bank == null;
    }

    public function getIdFromDescription($description, $pre) {
        $pos = strpos($description, $pre);
        $id = "";
        for ($i = $pos + strlen($pre); $i < strlen($description); $i++)
            if (is_numeric($description[$i]))
                $id .= $description[$i];
            else
                break;
        return $id;
    }

    public function solveTransactions() {
        $transactions = $this->getTransactions();
        foreach ($transactions as $transaction) {
            $description = $transaction['description'];
            if (str_contains($description, 'ORDER') && $transaction['transactionID'] > 2513) {
                $order_id = $this->getIdFromDescription($transaction['description'], 'ORDER');
                if ($this->checkTransaction($order_id, $transaction['transactionID'])) {
                    $auto_bank = new AutoBank();
                    $auto_bank->order_id = $order_id;
                    $auto_bank->amount = $transaction['amount'];
                    $auto_bank->transactionNumber = $transaction['transactionID'];
                    $this->save($auto_bank);
                }
            }
        }
    }

    public function getTotalAmount($order_id) {
        $auto_banks = $this->object->where('order_id', '=', $order_id)->get();
        $total_amount = 0;
        foreach($auto_banks as $auto_bank) {
            $total_amount += $auto_bank->amount;
        }
        return $total_amount;
    }

    public function getFirst() {
        return $this->object->first();
    }

    public function findByKeyword($keyword) {
        return $this->object->where('name', 'like', '%' . $keyword . '%')->orWhere('price', 'like', '%' . $keyword .'%')->get();
    }

    public function delete($id) {
        $object = $this->object->find($id);
        if($object)
            $object->delete();
        return $id;
    }

    public function update($id, $data) {
        $this->object->where('id', $id)->update($data);
        return $this->object->find($id);
    }

    public function save($data) {
        $object = $data;
        $object->save();
        return $object->id;
    }

    public function find($id) {
        return $this->object->find($id);
    }

    // public function getStatus($order_id) {
    //     $total_amount = $this->getTotalAmount($order_id);
    //     $order = $this->orderService->find($order_id);
    
    //     if ($total_amount >= $order->total) {
    //         // Trả về kết quả thành công
    //         return [
    //             'status' => 'success',
    //             'message' => 'Đã thanh toán đủ',
    //         ];
    //     } else {
    //         // Trả về kết quả thất bại
    //         return [
    //             'status' => 'fail',
    //             'message' => 'Chưa thanh toán đủ',
    //             'total_amount' => $total_amount,
    //             'remaining' => $order->total - $total_amount,
    //         ];
    //     }
    // }
    
}

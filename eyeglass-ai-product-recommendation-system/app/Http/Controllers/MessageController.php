<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Http\Requests\StoreMessageRequest;
use App\Http\Requests\UpdateMessageRequest;
use App\Http\Services\MessageService;
use App\Http\Services\ProductService;
use Request;

class MessageController extends Controller
{

    public function __construct(MessageService $messageService,
                                ProductService $productService)
    {
        $this->messageService = $messageService;
        $this->productService = $productService;
    }
    public function index()
    {
        return "Hello Message";
    }

    public function create($content, $type, $id, $product_id = 0)
    {
        $data = new Message();
        $data->content = $content;
        $data->type = $type;
        $data->user_id = $id;
        if($product_id != 0){
            $data->url = $this->productService->find($product_id)->urlImage;
            $data->product_id = $product_id;
        }
        return $this->messageService->save($data);
       
       
    }

    public function solveCreate(Request $request)
    {
        $data = new Message();
        $data->content = $request->content;
        $data->type = $request->type;
        $data->user_id = $request->id;
        return $this->messageService->save($data);
    }
   
}

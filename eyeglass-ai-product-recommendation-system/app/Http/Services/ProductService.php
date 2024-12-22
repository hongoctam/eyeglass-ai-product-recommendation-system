<?php

namespace App\Http\Services;


use App\Http\Services\RoleAccountService;
use App\Models\Product;
use Cookie;

class ProductService
{

    public function __construct(Product $object)
    {
        $this->object = $object;
    }

    public function getAll() {
        $products = $this->object->get();
        # Phần Description chỉ lấy 100 ký tự đầu tiên
        foreach ($products as $product) {
            if (strlen($product->description) > 20) {
                $product->description = substr($product->description, 0, 20) . '...';
            }
        }
        return $products;
    }

    public function getFull() {
        return $this->object->get();
    }

    public function search($keyword) {
        return $this->object->where('name', 'like', '%' . $keyword . '%')->orWhere('price', 'like', '%' . $keyword .'%')->get();
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
}

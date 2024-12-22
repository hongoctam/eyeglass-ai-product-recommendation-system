<?php

namespace App\Http\Services;


use App\Http\Services\RoleAccountService;
use App\Models\Message;
use Cookie;

class MessageService
{

    public function __construct(Message $object)
    {
        $this->object = $object;
    }

    public function getAll() {
        $messages = $this->object->get();
        return $messages;
    }

    public function getByUserId($id) {
        return $this->object->where('user_id', '=', $id)->get();
    }

    public function save($data) {
        $object = $data;
        $object->save();
        return $object->id;
    }

    public function find($id) {
        return $this->object->find($id);
    }

    public function checkLogin($phonenumber, $password) {
        return $this->object->where('phoneNumber', '=', $phonenumber)->where('password', '=', $password)->first();
    }
}

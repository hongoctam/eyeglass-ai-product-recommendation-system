@extends("user.layout.main")

@section("title")
    Thanh toán đơn hàng
@endsection

@section("tag")
    @php
        $tag = "";
    @endphp
@endsection

@section('css')
    <style>
        .product{
            width: 60px;
            height: 60px;
            object-fit: cover;
        }
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
    </style>
@endsection

@section('script')
    <script type="">
        loop = window.setInterval(() =>  {
            // get api /api/check/10
            $.ajax({
                url: "/api/check/{{$order->id}}",
                type: "GET",
                success: function (response) {
                    const text = response.name;
                    const color = response.color; // success, warning
                    $("#status").text(text);
                    $("#status").removeClass("badge-success");
                    $("#status").removeClass("badge-warning");
                    $("#status").addClass("badge-"+color);

                    if (color == "success") {
                        clearInterval(loop);
                    }

                    console.log(response);
                }
            });
        }, 1000);
    </script>
@endsection

@section("content")
    <!-- breadcrumb -->
    <form class="bg0 p-t-75 p-b-85">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="justify-content-center d-flex">
                            <div class="table-shopping-cart 50vw">
                                <img src="{{url($urlQA)}}" class="center">
                            </div>

                        </div>
                        <div class="">
                            <h1 class="text-center my-1"><span id="status" class="badge badge-{{$order->status->color}}" >{{$order->status->name}}</span></h1>
                            <h6 class="text-center my-1">Ngân hàng: {{$bank->name}} ({{$bank->shortName}})</h6>
                            <h5 class="text-center my-1">Số tài khoản: {{$bank->number}}</h5>
                            <h3 class="text-center text-danger my-1">Số tiền: {{number_format($order->total_price, 0, '', ',')}} VND</h3>
                            <h4 class="text-center my-1">Nội dung: ORDER{{$order->id}}</h4>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </form>
@endsection

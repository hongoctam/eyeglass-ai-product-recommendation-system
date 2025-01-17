@extends("user.layout.main")

@section("title")
    Giỏ Hàng
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
    </style>
@endsection

@section("content")
    <!-- breadcrumb -->
    <div class="container">
        <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
            <a href="" class="stext-109 cl8 hov-cl1 trans-04">
                Trang Chủ
                <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
            </a>

            <span class="stext-109 cl4">
                Giỏ Hàng
            </span>
        </div>
    </div>

    <!-- Giỏ Hàng -->
    <div class="bg0 p-t-75 p-b-85">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1">Sản phẩm</th>
                                    <th class="column-2"></th>
                                    <th class="column-3">Giá</th>
                                    <th class="column-4">Số lượng</th>
                                    <th class="column-5">Tổng</th>
                                </tr>

                                @foreach($carts as $item)
                                    <tr class="table_row">
                                        <td class="column-1">
                                            <div class="how-itemcart1">
                                                <img src="{{asset($item->product->urlImage)}}" alt="IMG" class="product">
                                            </div>
                                        </td>
                                        <td class="column-2">{{$item->product->name}}</td>
                                        <td class="column-3">{{number_format($item->product->price, 0, '', ',')}} đ</td>
                                        <td class="column-4">
                                            <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                                <a href="{{route('user.cart.pre', ['id'=>$item->id])}}">
                                                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                                </div>
                                                </a>

                                                <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="{{$item->quantity}}" readonly>
                                                <a href="{{route('user.cart.next', ['id'=>$item->id])}}">
                                                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                                </div>
                                                </a>
                                            </div>
                                        </td>
                                        <td class="column-5">{{number_format($item->product->price * $item->quantity, 0, '', ',')}} đ</td>
                                    </tr>
                                @endforeach

                            </table>
                        </div>

                       
                    </div>
                </div>

                <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                    <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                        <h4 class="mtext-109 cl2 p-b-30">
                            Tổng Giỏ Hàng
                        </h4>

                        <div class="flex-w flex-t bor12 p-b-13">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Tạm Tính:
								</span>
                            </div>

                            <div class="size-209">
								<span class="mtext-110 cl2">
									{{number_format($total, 0, '', ',')}} VND
								</span>
                            </div>
                        </div>

                        <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                            <div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Vận Chuyển:
								</span>
                            </div>

                            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                <p class="stext-111 cl6 p-t-2">
                                    Sau khi thanh toán. Đơn hàng sẽ vận chuyển đến địa chỉ của bạn trong vòng 3-5 ngày làm việc.
                                </p>

                              
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-27 p-b-33">
                            <div class="size-208">
								<span class="mtext-101 cl2">
									Tổng Cộng: &nbsp; &nbsp; &nbsp;
								</span>
                            </div>

                            <div class="size-209 p-t-1">
                                &nbsp;
								<span class="mtext-110 cl2">
                    
									{{number_format($total, 0, '', ',')}} VND
								</span>
                            </div>
                        </div>
                        <a href="{{asset(route('user.order.create'))}}">
                        <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            Thanh Toán
                        </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function(){

            $('#galleryModal').on('show.bs.modal', function (e) {
                $('#galleryImage').attr("src",$(e.relatedTarget).data("large-src"));
            });
            $("#myModal").modal('show');
        });
    </script>
@endsection

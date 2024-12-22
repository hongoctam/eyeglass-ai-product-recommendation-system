@extends("user.layout.main")

@section("title")
    Giới Thiệu
@endsection

@section("tag")
    @php
        $tag = "about";
    @endphp
@endsection

@section('css')
    <style>
        .productHome{
            width: 300px;
            height: 350px;
            object-fit: cover;
        }

         .product{
             width: 60px;
             height: 60px;
             object-fit: cover;
         }
    </style>
@endsection

@section("content")
    <!-- Content page -->
    <section class="bg0 p-t-75 p-b-120">
        <div class="container">
            <div class="row p-b-148">
                <div class="col-md-7 col-lg-8">
                    <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
                        <h3 class="mtext-111 cl2 p-b-16">
                            Câu Chuyện Của Chúng Tôi
                        </h3>

                        <p class="stext-113 cl6 p-b-26">
                            Chúng tôi khởi đầu với sứ mệnh mang đến những chiếc kính mắt chất lượng cao, phong cách và phù hợp với mọi nhu cầu của khách hàng. Với sự tận tâm và đam mê, chúng tôi đã xây dựng một thương hiệu không chỉ cung cấp sản phẩm mà còn mang lại niềm tin và phong cách sống cho khách hàng.
                        </p>

                        <p class="stext-113 cl6 p-b-26">
                            Từ những thiết kế truyền thống đến hiện đại, chúng tôi cam kết mang đến sự đa dạng trong lựa chọn. Tất cả các sản phẩm của chúng tôi đều được sản xuất từ những vật liệu chất lượng cao, đảm bảo sự bền bỉ và thoải mái tối đa khi sử dụng.
                        </p>

                        <p class="stext-113 cl6 p-b-26">
                            Mọi thắc mắc? Hãy ghé qua cửa hàng tại 470 Trần Đại Nghĩa, Đà Nẵng, Việt Nam hoặc liên hệ với chúng tôi qua số điện thoại (+84) 528 777 528.
                        </p>
                    </div>
                </div>

                <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
                    <div class="how-bor1 ">
                        <div class="hov-img0">
                            <img src="{{asset('asset/user/images/about-01.jpg')}}" alt="IMG">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="order-md-2 col-md-7 col-lg-8 p-b-30">
                    <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
                        <h3 class="mtext-111 cl2 p-b-16">
                            Sứ Mệnh Của Chúng Tôi
                        </h3>

                        <p class="stext-113 cl6 p-b-26">
                            Chúng tôi không chỉ bán kính mắt, mà còn mang đến tầm nhìn mới cho khách hàng. Với mong muốn tạo ra sự khác biệt, chúng tôi luôn tìm kiếm những xu hướng mới nhất để mang lại sự độc đáo và cá tính cho từng sản phẩm. Chất lượng và sự hài lòng của khách hàng là tiêu chí hàng đầu mà chúng tôi luôn theo đuổi.
                        </p>

                        <div class="bor16 p-l-29 p-b-9 m-t-22">
                            <p class="stext-114 cl6 p-r-40 p-b-11">
                                “Thành công không chỉ là việc bạn bán được bao nhiêu, mà là cách bạn làm cho khách hàng cảm thấy hài lòng với sản phẩm của mình.”
                            </p>

                            <span class="stext-111 cl8">
                                - Nhà sáng lập
                            </span>
                        </div>
                    </div>
                </div>

                <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
                    <div class="how-bor2">
                        <div class="hov-img0">
                            <img src="{{asset('asset/user/images/about-02.jpg')}}" alt="IMG">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

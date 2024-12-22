<!DOCTYPE html>
<html lang="en">
<head>
    <title>@yield('title')</title>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="{{url('asset/user/images/icons/favicon.ico')}}"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/bootstrap/css/bootstrap.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/fonts/font-awesome-4.7.0/css/font-awesome.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/fonts/iconic/css/material-design-iconic-font.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/fonts/linearicons-v1.0.0/icon-font.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/animate/animate.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/css-hamburgers/hamburgers.min.css')}}">
    {{--    <!--===============================================================================================-->--}}
    {{--    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/animsition/css/animsition.min.css')}}">--}}
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/select2/select2.min.css"')}}>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/daterangepicker/daterangepicker.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/slick/slick.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/MagnificPopup/magnific-popup.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/vendor/perfect-scrollbar/perfect-scrollbar.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/css/util.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/css/main.css')}}">
    <!--===============================================================================================-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.2/js/toastr.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.2/css/toastr.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('asset/user/css/chat.css')}}">
    {{-- <script src="{{asset('asset/user/js/chat.js')}}"></script> --}}
    @yield('css')
</head>
<?php
    use App\Models\Message;
    $user = auth()->user();
    if ($user != null){
        $message = Message::where('user_id', $user->id)->get();

        if ($message->count() == 0)
        Message::create([
            'content' => 'Chào bạn! Cảm ơn bạn đã quan tâm đến dịch vụ của chúng tôi. Nếu bạn đang tìm kiếm một chiếc kính mắt phù hợp với nhu cầu và phong cách cá nhân, hoặc có bất kỳ câu hỏi nào về sản phẩm, đừng ngần ngại liên hệ với chúng tôi. Chúng tôi sẵn sàng tư vấn chi tiết và giúp bạn lựa chọn chiếc kính phù hợp nhất. Hãy để chúng tôi giúp bạn có được trải nghiệm tốt nhất và sự hài lòng tuyệt đối!',
            'type' => 'BOT',
            'user_id' => $user->id
        ]);
        $message = Message::where('user_id', $user->id)->get();
        
    }
    else {
        $message = [];
    }
    
?>
<body class="animsition" @yield('onload')>
    <div class="chat-container chat-hidden">
        <div class="chat-header" onclick="toggleChat()">
            <img class="bot-avata" src="{{url('asset/user/images/icons/bot.png')}}" />
          <span>Hỗ trợ khách hàng (Tự động)</span>
        </div>
        <div class="messages">
            @foreach($message as $item)
            @if($item->type == "BOT")
                <div class="message">
                    <img class="bot-avata" src="{{url('asset/user/images/icons/bot.png')}}" />
                    @if ($item->url != "")
                    <a href="{{route('user.product.index')}}/{{$item->product_id}}" class="chat-mess">
                        <div class="text">{{$item->content}}</div> 
                    </a>
                    @else
                    <div class="text">{{$item->content}}</div>
                    @endif
                </div>
                @if ($item->url != "")
                <div class="message">
                    <a href="{{route('user.product.index')}}/{{$item->product_id}}">
                    <img class="product-chat" src="{{asset($item->url)}}" />
                    </a>
                </div>
                @endif
            @else
          <div class="message">
            <div class="send">{{$item->content}}</div>
          </div>
            @endif
            @endforeach
           
          
          <!-- Thêm tin nhắn tùy ý -->
        </div>
        <div class="input-container">
            <input 
              type="text" 
              placeholder="Soạn tin nhắn..." 
              id="messageInput" 
              onkeydown="handleKeyDown(event, {{auth()->user() ? auth()->user()->id: null}})" 
              autocomplete="off"
            />
            <button onclick="sendMessage({{auth()->user() ? auth()->user()->id: null}})">
                <svg viewBox="0 0 12 13" width="30" height="20" fill="currentColor" class="xfx01vb x1lliihq x1tzjh5l x1k90msu x2h7rmj x1qfuztq" style="--color: var(--primary-icon);"><g fill-rule="evenodd" transform="translate(-450 -1073)"><path d="m458.371 1079.75-6.633.375a.243.243 0 0 0-.22.17l-.964 3.255c-.13.418-.024.886.305 1.175a1.08 1.08 0 0 0 1.205.158l8.836-4.413c.428-.214.669-.677.583-1.167-.06-.346-.303-.633-.617-.79l-8.802-4.396a1.073 1.073 0 0 0-1.183.14c-.345.288-.458.77-.325 1.198l.963 3.25c.03.097.118.165.22.17l6.632.375s.254 0 .254.25-.254.25-.254.25"></path></g></svg>
            </button>
          </div>
        
      </div>
           <!-- Nút bật/tắt -->
<button class="toggle-button" onclick="toggleChat()">
    <img src="{{url('asset/user/images/icons/bot.png')}}" alt="Bot Avatar" />
  </button>

  <!--end chat-->
      
<!-- Header -->
<header class="header-v4">
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    Cửa hàng kính mắt hàng đầu Việt Nam
                </div>

                <div class="right-top-bar flex-w h-full">
                    <a href="{{route('login')}}" class="flex-c-m trans-04 p-lr-25">
                        {{(auth()->user() != null) ? auth()->user()->firstName : "Login"}}
                    </a>

                </div>
            </div>
        </div>
        @yield('tag')
        <div class="wrap-menu-desktop how-shadow1">
            <nav class="limiter-menu-desktop container">

                <!-- Logo desktop -->
                <a href="#" class="logo">
                    <img src="{{url('asset/user/images/icons/logo.png')}}" alt="IMG-LOGO">
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li class="{{($tag == 'home') ? "active-menu" : ""}}">
                            <a href="{{route('user.home')}}">Trang chủ</a>
                        </li>

                        <li class="{{($tag == 'shop') ? "active-menu" : ""}}">
                            <a href="{{route('user.product.index')}}">Cửa hàng</a>
                        </li>

                        <li class="{{($tag == 'about') ? "active-menu" : ""}}">
                            <a href="{{route('user.about')}}">Giới thiệu</a>
                        </li>

                        <li class="{{($tag == 'contact') ? "active-menu" : ""}}">
                            <a href="{{route('user.contact')}}">Liên hệ</a>
                        </li>
                    </ul>
                </div>

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m">
                   

                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="{{(auth()->check()) ? $carts->count() : "0"}}">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    <a href="{{route('user.order.index')}}" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                        <i class="zmdi zmdi-assignment-o"></i>
                    </a>
                </div>
            </nav>
        </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
            <a href="index.html"><img src="\asset\user\images\icons\logo.png" alt="IMG-LOGO"></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
       

            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
                <i class="zmdi zmdi-shopping-cart"></i>
            </div>

            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>
            </a>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>
    </div>


    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li>
                <div class="left-top-bar">
                    Cửa hành kính mắt uy tín nhất Việt Nam
                </div>
            </li>

            <li>
                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        Hỗ trợ
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        Đăng xuất
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        EN
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        USD
                    </a>
                </div>
            </li>
        </ul>

        <ul class="main-menu-m">
            <li>
                <a href="{{route('login')}}">Trang chủ</a>

                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li>
                <a href="{{route('user.product.index')}}">Cửa hàng</a>
            </li>

           
            <li>
                <a href="{{route('user.about')}}">Giới thiệu</a>
            </li>

            <li>
                <a href="{{route('user.contact')}}">Hỗ trợ</a>
            </li>
        </ul>
    </div>

    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                <img src="\asset\user\images\icons\icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15">
                <button class="flex-c-m trans-04">
                    <i class="zmdi zmdi-search"></i>
                </button>
                <input class="plh3" type="text" name="search" placeholder="Search...">
            </form>
        </div>
    </div>
</header>

<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>
    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Giỏ hàng của bạn
				</span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-cart-content flex-w js-pscroll">
            <ul class="header-cart-wrapitem w-full">
                @isset($carts)
                @foreach($carts as $item)
                    <li class="header-cart-item flex-w flex-t m-b-12">
                    <a href="{{route('user.cart.delete', ['id'=>$item->id])}}">
                        <div class="header-cart-item-img">
                            <img src="{{asset($item->product->urlImage)}}" alt="IMG" class="product">
                        </div>
                    </a>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="{{route('user.product.detail', ['id'=>$item->product->id])}}" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            {{$item->product->name}}
                        </a>

                        <span class="header-cart-item-info">
								{{$item->quantity}} x {{number_format($item->product->price, 0, '', ',')}} VND
							</span>
                    </div>
                </li>
                @endforeach
                @endisset
            </ul>

            <div class="w-full">
                <div class="header-cart-buttons flex-w w-full">
                    <a href="{{route('user.cart.index')}}" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        Xem giỏ hàng
                    </a>

                    <a href="{{asset(route('user.order.create'))}}" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                        Thanh toán
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

@yield('content')
<!-- Footer -->
<footer class="bg3 p-t-75 p-b-32">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Danh mục sản phẩm
                </h4>

                <ul>
                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Kính thời trang
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Kính râm
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Kính trẻ em
                        </a>
                    </li>

                </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Hỗ trợ
                </h4>

                <ul>
                    <li class="p-b-10">
                        <a href="{{route('user.contact')}}" class="stext-107 cl7 hov-cl1 trans-04">
                            Mua hàng
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="{{route('user.contact')}}" class="stext-107 cl7 hov-cl1 trans-04">
                            Hoàn trả
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="{{route('user.contact')}}" class="stext-107 cl7 hov-cl1 trans-04">
                            Vận chuyển
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="{{route('user.contact')}}" class="stext-107 cl7 hov-cl1 trans-04">
                            Câu hỏi
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Liên hệ
                </h4>

                <p class="stext-107 cl7 size-201">
                    Có thắc mắc gì không? Hãy ghé thăm cửa hàng tại 470 Trần Đại Nghĩa, Đà Nẵng, Việt Nam hoặc gọi cho chúng tôi qua số (+84) 528 777 888.
                </p>

                <div class="p-t-27">
                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-facebook"></i>
                    </a>

                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-instagram"></i>
                    </a>

                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-pinterest-p"></i>
                    </a>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Bản tin
                </h4>

                <form>
                    <div class="wrap-input1 w-full p-b-4">
                        <input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
                        <div class="focus-input1 trans-04"></div>
                    </div>

                    <div class="p-t-18">
                        <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                            Đăng ký
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="p-t-40">
            <div class="flex-c-m flex-w p-b-18">
                <a href="#" class="m-all-1">
                    <img src="{{asset('asset/user/images/icons/icon-pay-01.png')}}" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="{{asset('asset/user/images/icons/icon-pay-02.png')}}" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="{{asset('asset/user/images/icons/icon-pay-03.png')}}" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="{{asset('asset/user/images/icons/icon-pay-04.png')}}" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="{{asset('asset/user/images/icons/icon-pay-05.png')}}" alt="ICON-PAY">
                </a>
            </div>

            <p class="stext-107 cl6 txt-center">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Bản quyền &copy;<script>document.write(new Date().getFullYear());</script> Tất cả được bảo lưu | Được tạo bởi <a target="_blank">Hồ Tâm</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

            </p>
        </div>
    </div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>



<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/jquery/jquery-3.2.1.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/animsition/js/animsition.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/bootstrap/js/popper.js')}}"></script>
<script src="{{asset('asset/user/vendor/bootstrap/js/bootstrap.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/select2/select2.min.js')}}"></script>
<script>
    $(".js-select2").each(function(){
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/daterangepicker/moment.min.js')}}"></script>
<script src="{{asset('asset/user/vendor/daterangepicker/daterangepicker.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/slick/slick.min.js')}}"></script>
<script src="{{asset('asset/userjs/slick-custom.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/parallax100/parallax100.js')}}"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/MagnificPopup/jquery.magnific-popup.min.js')}}"></script>
<script>
    $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled:true
            },
            mainClass: 'mfp-fade'
        });
    });
</script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/isotope/isotope.pkgd.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/sweetalert/sweetalert.min.js')}}"></script>

<!--===============================================================================================-->
<script src="{{asset('asset/user/vendor/perfect-scrollbar/perfect-scrollbar.min.js')}}"></script>
<script>
    $('.js-pscroll').each(function(){
        $(this).css('position','relative');
        $(this).css('overflow','hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function(){
            ps.update();
        })

        $('.js-addwish-b2').on('click', function(e){
            e.preventDefault();
        });

        $('.js-addwish-b2').each(function(){
            var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
            $(this).on('click', function(){
                swal(nameProduct, "is added to wishlist !", "success");

                $(this).addClass('js-addedwish-b2');
                $(this).off('click');
            });
        });

        $('.js-addwish-detail').each(function(){
            var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

            $(this).on('click', function(){
                swal(nameProduct, "is added to wishlist !", "success");

                $(this).addClass('js-addedwish-detail');
                $(this).off('click');
            });
        });
        $('.js-addcart-detail').each(function(){
            var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
            $(this).on('click', function(){
                swal(nameProduct, "is added to cart !", "success");
            });
        });
    });
    $('.js-pscroll').each(function(){
        $(this).css('position','relative');
        $(this).css('overflow','hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function(){
            ps.update();
        })
    });

    function loadPage(result, type) {
        if (result !== null) {
            if (type === 'success')
                toastr.success(result);
            if (type === 'danger')
                toastr.error(result);
            if (type === 'warning')
                toastr.warning(result);
            if (type === 'info')
                toastr.info(result);
        }
    };
</script>
<!--===============================================================================================-->
<script src="{{asset('asset/user/js/main.js')}}"></script>
<script src="{{asset('asset/user/js/chat.js')}}"></script>
@yield('script')

</body>
</html>

<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="apple-touch-icon" sizes="76x76" href="{{asset('asset/user/image/favicon.ico')}}">

    <title> Đăng nhập tài khoản </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link rel="apple-touch-icon" sizes="76x76" href="{{asset('asset/user/image/apple-icon.png')}}" />
    <link rel="icon" type="image/png" href="{{asset('asset/user/image/favicon.png')}}" />

    <!-- Phông chữ và biểu tượng -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

    <!-- Tệp CSS -->
    <link href="{{asset('asset/user/css/bootstrap.min.css')}}" rel="stylesheet" />
    <link href="{{asset('asset/user/css/material-bootstrap-wizard.css')}}" rel="stylesheet" />

    <!-- CSS chỉ dành cho mục đích demo, không nên bao gồm trong dự án -->
    <link href="{{asset('asset/user/css/demo.css')}}" rel="stylesheet" />

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.2/js/toastr.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.2/css/toastr.min.css">
</head>


<body @yield('onload')>
<div class="image-container set-full-height" style="background-image: url('asset/user/images/slide-04.png')">

    <!--  Tạo tài khoản  -->
    <a href="{{route('register')}}" class="made-with-mk">
        <div class="brand"> ? </div>
        <div class="made-with"> <strong>Tạo tài khoản </strong> </div>
    </a>

    <!--   Container lớn   -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <!--      Container của wizard      -->
                <div class="wizard-container">
                    <div class="card wizard-card" data-color="green" id="wizardProfile">
                        <form action="" method="post">
                            @csrf
                            <div class="wizard-header">
                                <h3 class="wizard-title">
                                    Đăng nhập vào trang web của chúng tôi
                                </h3>
                                <h5>Vui lòng điền thông tin chính xác bên dưới</h5>
                            </div>
                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">Tài khoản</a></li>
                                </ul>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text"> </h4>
                                        <div class="col-sm-4 col-sm-offset-1">
                                            <div class="picture-container">
                                                <div class="">
                                                    <img style="width: 240px" src="{{asset('asset/user/images/icons/logo.png')}}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">face</i>
                                                </span>
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Số điện thoại <small>(bắt buộc)</small></label>
                                                    <input name="phoneNumber" type="text" class="form-control" autocomplete="off" autofocus tabindex="1">
                                                    @error('phoneNumber')
                                                    <span class="text-bold text-italic text-danger">{{$message}}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">record_voice_over</i>
                                                </span>
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Mật khẩu <small>(bắt buộc)</small></label>
                                                    <input name="password" type="password" class="form-control" tabindex="2">
                                                    @error('password')
                                                    <span class="text-bold text-italic text-danger">{{$message}}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="remember-form">
                                                <input type="checkbox">
                                                <span href="register2.html">Nhớ tôi</span>
                                                &nbsp; &nbsp; &nbsp;
                                                <a href="" class="" data-toggle="modal" data-target="#modalLoginForm">Quên mật khẩu</a>
                                                &nbsp &nbsp; &nbsp;
                                                <a href="{{route('user.contact')}}" class="" >Hỗ trợ</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="pull-right">
                                    <input type='submit' class='btn btn-finish btn-fill btn-success btn-wd' name='finish' value='ĐĂNG NHẬP' tabindex="3" />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div> <!-- Container của wizard -->
            </div>
        </div><!-- Kết thúc hàng -->
    </div> <!-- Container lớn -->
    <!-- Modal -->
    <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <form action="{{route('user.login.forgotPassword')}}" method="post">
            @csrf
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body mx-3">
                        <div class="md-form mb-5">
                            <input type="text" id="defaultForm-phonenumber" class="form-control validate" name="phoneNumber">
                            <label data-error="wrong" data-success="right" for="defaultForm-email">Số điện thoại của bạn</label>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-default">Lấy lại mật khẩu</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- Kết thúc Modal -->

    <div class="footer">
        <div class="container text-center">
            Bản quyền &copy;<script>document.write(new Date().getFullYear());</script> Tất cả được bảo lưu | Được tạo bởi <a target="_blank">Hồ Tâm</a>
        </div>
    </div>
</div>

</body>
<script src="{{asset('asset/user/js/jquery-2.2.4.min.js')}}" type="text/javascript"></script>
<script src="{{asset('asset/user/js/bootstrap.min.js')}}" type="text/javascript"></script>
<script src="{{asset('asset/user/js/jquery.bootstrap.js')}}" type="text/javascript"></script>
<script src="{{asset('asset/user/js/material-bootstrap-wizard.js')}}"></script>
<script src="{{asset('asset/user/js/jquery.validate.min.js')}}"></script>
<script>
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

</html>

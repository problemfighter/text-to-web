<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/internal-asset/js/lib/asciidoctor.min.js"></script>
    <script src="/internal-asset/js/lib/jquery-3.2.1.min.js"></script>

    <script src="/internal-asset/js/jquery-context-menu/jquery.contextMenu.min.js"></script>
    <script src="/internal-asset/js/jquery-context-menu/jquery.ui.position.min.js"></script>
    <link rel="stylesheet" href="/internal-asset/js/jquery-context-menu/jquery.contextMenu.min.css" />

    <link rel="stylesheet" href="/internal-asset/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/internal-asset/css/style.css" />
    <link rel="stylesheet" href="/internal-asset/css/asciidoctor.css" />

    <script>
        jQuery(document).ready(function () {
            jQuery("#text").on('change keyup paste', function () {
                var currentVal = $(this).val();
                var asciidoctor = Asciidoctor();
                var html = asciidoctor.convert(currentVal, { 'safe': 'server', 'attributes': { 'showtitle': true, 'icons': 'font' } })
                console.log(html);
                display = jQuery("#display");
                display.html("");
                display.html(html);
            });


            $.contextMenu({
                selector: '.context-menu-one',
                callback: function(key, options) {
                    var m = "clicked: " + key + " on " + $(this).text() + " " + $(this).attr("data-action");
                    console.log(m);
                    console.log(options);
                },
                items: {
                    "edit": {name: "Edit", icon: "edit"},
                    "cut": {name: "Cut", icon: "cut"},
                    copy: {name: "Copy", icon: "copy"},
                    "paste": {name: "Paste", icon: "paste"},
                    "delete": {name: "Delete", icon: "delete"},
                    "sep1": "---------",
                    "quit": {name: "Quit", icon: function(){
                            return 'context-menu-icon context-menu-icon-quit';
                        }}
                }
            });


        });


    </script>
</head>
<body class="d-flex flex-column h-100">

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">General</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>


<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 col-lg-2 d-md-block bg-light sidebar" style="display: none;">
                <div class="position-sticky pt-3">
                    <ul class="list-unstyled ps-0">
                        <li class="mb-1">
                            <button class="btn btn-toggle align-items-center rounded collapsed">
                                Home
                            </button>
                            <div>
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li><a href="#" class="link-dark rounded">Overview</a></li>
                                    <li><a href="#" class="link-dark rounded">Updates</a></li>
                                    <li><a href="#" class="link-dark rounded">Reports</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="mb-1">
                            <button class="btn btn-toggle align-items-center rounded collapsed"
                                    data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
                                    aria-expanded="false">
                                Dashboard
                            </button>
                            <div class="collapse" id="dashboard-collapse">
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li><a href="#" class="link-dark rounded">Overview</a></li>
                                    <li><a href="#" class="link-dark rounded">Weekly</a></li>
                                    <li><a href="#" class="link-dark rounded">Monthly</a></li>
                                    <li><a href="#" class="link-dark rounded">Annually</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="mb-1">
                            <button class="btn btn-toggle align-items-center rounded collapsed"
                                    data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                                Orders
                            </button>
                            <div class="collapse" id="orders-collapse">
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li><a href="#" class="link-dark rounded">New</a></li>
                                    <li><a href="#" class="link-dark rounded">Processed</a></li>
                                    <li><a href="#" class="link-dark rounded">Shipped</a></li>
                                    <li><a href="#" class="link-dark rounded">Returned</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="border-top my-3"></li>
                        <li class="mb-1">
                            <button class="btn btn-toggle align-items-center rounded collapsed"
                                    data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                                Account
                            </button>
                            <div class="collapse" id="account-collapse">
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li><a href="#" class="link-dark rounded">New...</a></li>
                                    <li><a href="#" class="link-dark rounded">Profile</a></li>
                                    <li><a href="#" class="link-dark rounded">Settings</a></li>
                                    <li><a href="#" class="link-dark rounded">Sign out</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>



            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="row">
                    <div class="col-6">
                        <textarea id="text" style="min-width: 100%; height: 100%;" rows="15"></textarea>
                    </div>
                    <div class="col-6 asciidoctor-content">
                        <div id="display"></div>
                    </div>
                </div>

<#--                <span class="context-menu-one btn btn-neutral" data-action="xyz">right click me</span>-->
<#--                <span class="context-menu-one btn btn-neutral" data-action="abc">right click me</span>-->
            </main>
        </div>
    </div>
</main>

<footer class="footer mt-auto py-3 bg-dark">
    <div class="container-fluid">
        <span class="text-white">Footer Note</span>
    </div>
</footer>
</body>
</html>
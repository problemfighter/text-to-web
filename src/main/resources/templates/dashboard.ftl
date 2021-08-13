<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/internal-asset/js/lib/asciidoctor.min.js"></script>
    <script src="/internal-asset/js/lib/jquery-3.2.1.min.js"></script>

    <script src="/internal-asset/js/jquery-context-menu/jquery.contextMenu.min.js"></script>
    <script src="/internal-asset/js/jquery-context-menu/jquery.ui.position.min.js"></script>
    <link rel="stylesheet" href="/internal-asset/js/jquery-context-menu/jquery.contextMenu.min.css" />

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
<body>
<h1>Bismillah</h1>


<textarea id="text">

</textarea>

<div id="display"></div>
<span class="context-menu-one btn btn-neutral" data-action="xyz">right click me</span>
<span class="context-menu-one btn btn-neutral" data-action="abc">right click me</span>
</body>
</html>
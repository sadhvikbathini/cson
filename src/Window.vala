class Window : Gtk.ApplicationWindow {
    public GLib.Settings settings;
    public Gtk.Dialog dialog;
    public Gtk.Button savechanges;
    public Gtk.Button button1;
    public Gtk.Label cfmd;
    public Gtk.Label ctmd;
    public Gtk.Entry fmail;
    public Gtk.Entry pass;
    public Gtk.Entry tmail;
    public Gtk.Stack stack { get; set;}

    public Window (Application app) {
        Object (application: app);
    }
    construct{
//        // this.set_title("CaptureScript");
        this.set_default_size(320,130);
        settings=new GLib.Settings("com.github.sadhvikbathini.cson");
        move(settings.get_int("pos-x"),settings.get_int("pos-y"));

        delete_event.connect(e =>{
            return before_destroy();
        });
        this.border_width = 10;

        // var label = new Gtk.Label ("Capture a photo before login");
        // label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        // var switcher = new Gtk.Switch ();
        // switcher.set_active(settings.get_boolean("saveswitch"));
        // switcher.notify["active"].connect(switcher_cb);
        var label1=new Gtk.Label("Capture a photo after a sucessfull login");
        label1.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        var switcher1 =new Gtk.Switch();
        switcher1.set_active(settings.get_boolean("saveswitch1"));
        switcher1.notify["active"].connect(switcher_cb1);

        button1 = new Gtk.Button.with_label("Save Changes");
        button1.get_style_context().add_class("suggested-action");
        button1.clicked.connect(on_clicked);

        stack = new Gtk.Stack();
        var frommail = new Gtk.Box(HORIZONTAL,0);
        var ctm=new Gtk.Label("Current Email [From ]   ➡️ ");
        ctm.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        ctmd=new Gtk.Label(settings.get_string("frommail"));
        ctmd.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);
        frommail.pack_start(ctm,true,false);
        frommail.pack_start(ctmd,true,false);
        var tomail = new Gtk.Box(HORIZONTAL,0);
        var cfm=new Gtk.Label(" Current Email [To ]      ➡️ ");
        cfm.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        cfmd=new Gtk.Label(settings.get_string("tomail"));
        cfmd.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);
        tomail.pack_start(cfm,true,false,2);
        tomail.pack_start(cfmd,true,false);
        var welcome = new Gtk.Box(VERTICAL,1);
        welcome.set_border_width(2);
        var cson = new Gtk.Label("CSOn");
        cson.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        welcome.pack_start(cson);
        welcome.set_center_widget(new Gtk.Image.from_file(GLib.Environment.get_home_dir() +"/.cson/com.github.sadhvikbathini.cson.jpg"));
        welcome.pack_end(tomail,true,true);
        welcome.pack_end(frommail,true,true);
        welcome.pack_end(new Gtk.Label(" "));
        var button = new Gtk.Button.with_label("Change/Edit");
        button.get_style_context().add_class("suggested-action");
        // var run1 = new Gtk.Box(HORIZONTAL,1);
        // run1.pack_start(label,false,false);
        // var viewimg_before = new Gtk.Button.with_label("View");
        // viewimg_before.clicked.connect((img_viewerbefore));
        // run1.pack_end(viewimg_before,false,false,2);
        // run1.pack_end(switcher,false,false,2);
        var run2 = new Gtk.Box(HORIZONTAL,1);
        run2.pack_start(label1,false,false);
        run2.pack_start(new Gtk.Label("     "),true,false);
        var viewimg = new Gtk.Button.with_label("View");
        viewimg.clicked.connect((img_viewer));
        run2.pack_end(viewimg,false,false,2);
        run2.pack_end(switcher1,false,false,2);
        var changemail = new Gtk.Box(HORIZONTAL,1);
        var chmail = new Gtk.Label("Change your E-mail : ");
        chmail.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);
        changemail.pack_start(chmail,false,false);
        changemail.pack_end(button,false,false);
        var config = new Gtk.Box(VERTICAL,0);
        config.set_border_width(2);
        config.pack_start(changemail,true,false);
        // config.pack_start(run1,true,false);
        config.pack_start(run2,true,false);
        config.pack_start(new Gtk.Label(" "),true,false);
        config.pack_start(button1,false,true);

        button.clicked.connect((open_dialog));
        stack.add_titled(welcome,"welcome","Welcome");
        stack.add_titled(config,"config","Configure");
        add(stack);

        var headerbar = new HeaderBar(this);
        set_titlebar(headerbar);

        show_all();

        if (settings.get_string("frommail") == "from@gmail.com"){
            open_dialog();
        }

    }
    public void open_dialog (){
        dialog = new Gtk.Dialog.with_buttons(
                "CSOn",
                this,
                Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT
                    );
        var content_area = dialog.get_content_area();
        var mail1 = new Gtk.Label("Enter Email [From ] :");
        mail1.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        var pass1 = new Gtk.Label("Enter Password        :");
        pass1.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        var mail2 = new Gtk.Label("Enter Email [To ]      :");
        mail2.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        fmail = new Gtk.Entry();
        fmail.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        fmail.text = settings.get_string("frommail");
        pass = new Gtk.Entry();
        pass.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
//        if (settings.get_string("frommail") == "from@gmail.com"){
        pass.text = settings.get_string("pass");
//        }
        tmail = new Gtk.Entry();
        tmail.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        tmail.text = settings.get_string("tomail");
        savechanges = new Gtk.Button.with_label("INSTALL");
        savechanges.get_style_context().add_class("suggested-action");
        fmail.changed.connect(()=>{savechanges.set_sensitive(true);});
        pass.changed.connect(()=>{savechanges.set_sensitive(true);});
        tmail.changed.connect(()=>{savechanges.set_sensitive(true);});
        savechanges.clicked.connect(save_mail);
        var cancel = new Gtk.Button.with_label("Cancel");
        cancel.clicked.connect(()=>{dialog.destroy();});
        var entrylog2 = new Gtk.Box(HORIZONTAL,1);
        entrylog2.pack_start(mail1,false,false,10);
        entrylog2.pack_start(fmail,true,true,10);
        var entrylog1 = new Gtk.Box(HORIZONTAL,1);
        entrylog1.pack_start(pass1,false,false,10);
        entrylog1.pack_start(pass,true,true,10);
        var entrylog3 = new Gtk.Box(HORIZONTAL,1);
        entrylog3.pack_start(mail2,false,false,10);
        entrylog3.pack_start(tmail,true,true,10);
        var buttonoptions = new Gtk.Box(HORIZONTAL,1);
        buttonoptions.pack_end(savechanges,true,true,5);
        if(settings.get_string("frommail") != "from@gmail.com"){
            savechanges.set_label("Save Changes");
            buttonoptions.pack_end(cancel,true,true,5);
        }
        var entrylog = new Gtk.Box(VERTICAL,2);
        entrylog.set_border_width(0);
        var diaent = new Gtk.Label("      ✉️ Enter your E-mail and Password      ");
        diaent.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        entrylog.set_center_widget(diaent);
        entrylog.pack_end(buttonoptions,true,true);
        entrylog.pack_end(new Gtk.Label(" "));
        entrylog.pack_end(entrylog3,true,true);
        entrylog.pack_end(entrylog1,true,true);
        entrylog.pack_end(entrylog2,true,true);
        entrylog.pack_end(new Gtk.Label(" "));
        content_area.add(entrylog);
        dialog.show_all();
        dialog.present();
    }
    public bool before_destroy(){
        int x,y;
        get_position(out x,out y);
        settings.set_int("pos-x",x);
        settings.set_int("pos-y",y);
        return false;
    }
    public void save_mail(){
        settings.set_string("frommail",fmail.text);
        settings.set_string("pass",pass.text);
        settings.set_string("tomail",tmail.text);
        ctmd.set_label(settings.get_string("frommail"));
        cfmd.set_label(settings.get_string("tomail"));
        if (settings.get_string("frommail") != "" &&  settings.get_string("pass") != "" && settings.get_string("tomail") != "" ){
            savechanges.set_sensitive(false);
            on_clicked();
            dialog.destroy();
        } else {
          settings.set_string("error","📋 Fill the empty fields! ⌨️ ");
          error_dialog();
        }
    }
    //  void switcher_cb (Object switcher, ParamSpec pspec) {
    //     if ((switcher as Gtk.Switch).get_active()){
    //         settings.set_boolean("switch",true);
    //         button1.set_sensitive(true);}
    //     else{
    //         settings.set_boolean("switch",false);
    //         button1.set_sensitive(true);}
    // }
     void switcher_cb1 (Object switcher1, ParamSpec pspec) {
        if ((switcher1 as Gtk.Switch).get_active()){
            settings.set_boolean("switch1",true);
            button1.set_sensitive(true);}
        else{
            settings.set_boolean("switch1",false);
            button1.set_sensitive(true);}
    }
    public void on_clicked() {
        button1.set_sensitive(false);
        string err,error;
        // if(settings.get_boolean("switch")==true){
        //     GLib.Process.spawn_command_line_sync("pkexec CSOn -i -before "+settings.get_string("frommail")+" "+settings.get_string("pass")+" "+settings.get_string("tomail") ,out err,out error);
        //     settings.set_boolean("saveswitch",true);
        //     if (error != "" || err != ""){
        //         settings.set_string("error",err+"\n"+error);
        //         error_dialog();
        //     }
        // }
        // if(settings.get_boolean("switch")==false){
        //     GLib.Process.spawn_command_line_sync("pkexec CSOn -r -before");
        //     settings.set_boolean("saveswitch",false);
        //     // if (error != "" || err != ""){
        //     //     settings.set_string("error",err+"\n"+error);
        //     //     error_dialog();
        //     // }
        // }
        if(settings.get_boolean("switch1")==true){
            GLib.Process.spawn_command_line_sync("CSOn -i -after "+settings.get_string("frommail")+" "+settings.get_string("pass")+" "+settings.get_string("tomail"),out err, out error);
            settings.set_boolean("saveswitch1",true);
            if (error != "" || err != ""){
                settings.set_string("error",err+"\n"+error);
                error_dialog();
            }
        }
        if(settings.get_boolean("switch1")==false){
            GLib.Process.spawn_command_line_sync("CSOn -r -after",out err,out error);
            settings.set_boolean("saveswitch1",false);
//            // if (error != "" || err != ""){
//            //     settings.set_string("error",err+"\n"+error);
//            //     error_dialog();
//            // }
        }
    }
    void error_dialog(){
        var message_dialog = new Granite.MessageDialog.with_image_from_icon_name(
            "Error",
            settings.get_string("error"),
            "dialog-error",
            Gtk.ButtonsType.CLOSE
        );
        message_dialog.run ();
        message_dialog.destroy ();

    }
    void img_viewer () {
        var img_view = new Gtk.Dialog.with_buttons(
            "CSOn : Captured Image",
            this,
            Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT
        );
        var content_area = img_view.get_content_area();
        var image = new Gtk.Box(VERTICAL,2);
        image.set_center_widget(new Gtk.Image.from_file(GLib.Environment.get_home_dir() +"/.cson/image_cson.jpg"));
        var img_hed = new Gtk.Label("CAPTURED IMAGE");
        img_hed.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        image.pack_start(img_hed);
        content_area.add(image);
        img_view.show_all();
        img_view.present();
    }
    // void img_viewerbefore () {
    //     var img_view = new Gtk.Dialog.with_buttons(
    //         "CSOn : Captured Image",
    //         this,
    //         Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT
    //     );
    //     var content_area = img_view.get_content_area();
    //     var image = new Gtk.Box(VERTICAL,2);
    //     image.set_center_widget(new Gtk.Image.from_file(GLib.Environment.get_home_dir() +"/.cson/image_csonbefore.jpg"));
    //     var img_hed = new Gtk.Label("CAPTURED IMAGE");
    //     img_hed.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
    //     image.pack_start(img_hed);
    //     content_area.add(image);
    //     img_view.show_all();
    //     img_view.present();
    // }
}


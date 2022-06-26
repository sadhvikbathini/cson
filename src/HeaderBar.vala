class HeaderBar : Gtk.HeaderBar {
    public Window main_window{ get; construct; }

    public HeaderBar(Window window){
        Object( main_window : window);
    }
    construct{
        //set_title("CaptureScript");
        var stack_switcher = new Gtk.StackSwitcher();
        stack_switcher.stack = main_window.stack;

        set_custom_title(stack_switcher);
        set_show_close_button(true);
    }
}

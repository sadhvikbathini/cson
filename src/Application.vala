class Application : Gtk.Application {
    protected override void activate () {
        var window = new Window (this);
        add_window(window);
    }

    public Application () {
        Object (application_id: "com.github.sadhvikbathini.cson",
                flags: ApplicationFlags.FLAGS_NONE
        );
    }
}

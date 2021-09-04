# What is this?
`widget.lua` is just meant to be a nice starting point for creating your own Awesome WM widget.
It contains some basic boilerplate and some easily forgettable things I wanted to document so that I do not forget them later.

# How do I customize the boilerplate?
`widget.lua` is setup to be a basic widget that uses the awful.widget.watch function to update a widget on an interval.
Change the `external_command` to suit your needs.
Implement the `update_widget` function to lookup the correct widget or widgets you would like to update (using `get_children_by_id`) from your `widget_template` and use the `set_` methods to update as needed. (`set_markup`, `set_text`, `set_value` etc.)
The `widget_template` can be overridden by passing a custom one via the args in `rc.lua`.
This allows customization from your `rc.lua` much like the stock Awesome WM taglist and tasklist widgets.

# How do I use my widget in Awesome WM?
Rename `widget.lua` to match your widget.
Place it in your `~/.config/awesome/` folder.
Example `~/.config/awesome/myfolder/mywidget.lua`.
In your `rc.lua` you can then
```lua
-- import your widget class
local mywidget = require( "myfolder.mywidget" )
-- and in your wibox setup
	mywidget()
-- or to pass arguments..
	mywidget({ myarg = "value" })
```


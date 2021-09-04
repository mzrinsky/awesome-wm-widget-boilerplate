-- bring in awesome wm helpers..
local watch = require( "awful.widget.watch" )
local base = require( "wibox.widget.base" )
local wibox = require( "wibox" )

-- setup some config defaults..
local my_val = 0
local update_interval = 2

-- define a var to hold our widget object data
local widget = {
  mt = {},
}

-- constructor to create a new widget object
function widget.new( args )
  if args == nil then
    args = {}
  end
  if args.widget_template == nil then
    args.widget_template = {
      {
        -- put widget layouts here
        -- example:
        -- id = "widget_id",
        -- markup = args.my_val or my_val
      },
      layout = wibox.layout.fixed.horizontal,
    }
  end

  if args.update_interval == nil then
    args.update_interval = update_interval;
  end

  -- create a widget instance using the declarative widget_template
  local widget_instance = base.make_widget_from_value( args.widget_template )

  -- define an update_widget function to handle processing any command output
  -- and updating the widget with it
  local update_widget = function( widget, command_output )
    -- do things here with command_output
    -- example: get a widget by id, and set_markup to the output of the external_command
    -- self:get_children_by_id( 'widget_id' )[1]:set_markup(command_output)
  end

  -- run external_command every update_interval and call update_widget with the output and widget_instance
  watch(
    string.format( [[ external_command %s %s ]], "arg1", "arg2" ), args.update_interval,
      update_widget, widget_instance
   )

  -- return our widget instance
  return widget_instance
end

-- define a metatable __call so we can call the constructor with nicer syntax
-- this allows myWidget() below to map to new.
function widget.mt:__call( ... )
  return widget.new( ... )
end
-- apply the metatable to our object table
return setmetatable( widget, widget.mt )

-- this is now available via..
-- local myWidget = require( "folder.widget" )
-- local myInstance = myWidget()

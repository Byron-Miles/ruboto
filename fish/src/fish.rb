require 'ruboto/widget'

ruboto_import_widgets :Button, :EditText, :LinearLayout, \
  :RadioGroup, :RadioButton, :TextView

class Fish
  
  def on_create(bundle)
    super
    set_title 'Byron\'s Fish Market'

    self.content_view = linear_layout :orientation => :vertical do
      text_view :text => 'What would you like to order?'
      @group = radio_group do
        radio_button :text => "Tuna", :id => 0
        radio_button :text => "Trout", :id => 1
        radio_button :text => "Salmon", :id => 2
        radio_button :text => "Crab", :id => 3
        radio_button :text => "Lobster", :id => 4
      end
      @quantity = edit_text :hint => "Quantity"
      button :text => "Place Order", \
        :on_click_listener => proc { place_order }
      @order = text_view :text => "Order"
    end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end
  
  def place_order()
    count = @quantity.text.toString if @quantity.text != nil
    food = @group.child_at(@group.checked_radio_button_id).text.downcase
    @order.text += ": " + count + " " + food
  rescue
    puts "Exception placing order: #{$!}"
    puts $!.backtrace.join("\n")
  end
end

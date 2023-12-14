
class ManageInventory
  def initialize()
  end

  # For starting Menu of ManageInventory
  def startMenu()
    puts "
    -Manage Inventory section-
    1)View Inventory
    2)Add Inventory
    3)Update Inventory
    4)Delete Inventory
    5)Exit
    "
    res = gets.chomp.to_i

    case res
    when 1
      inventory()
    when 2
      addSection()
    when 3
      updateSection()
    when 4
      deleteSection()
    when 5
      puts "Exiting.."
    else
      puts "Please choose valid option"
      startMenu()
    end
  end


  def inventory()
    puts "this is inventory"

    startMenu()
  end

  def addSection()
    puts "this is add section"

   startMenu()
  end

  def updateSection()
     puts "this is update section"

     startMenu()
  end

  def deleteSection()
    puts "this is delete section"

    startMenu()
  end
end

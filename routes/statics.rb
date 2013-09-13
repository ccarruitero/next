class Statics < Cuba
  settings[:mote][:views] = File.expand_path('views/statics', Dir.pwd)

  define do
    on root do
      render('home')
    end
  end
end

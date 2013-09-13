class Events < Cuba
  define do
    on default do
      render 'events/events', title: 'Eventos'
    end
  end
end

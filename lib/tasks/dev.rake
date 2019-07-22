namespace :dev do
  DEFAULT_PASSWORD = 123456  
  DEFAULT_FILES_PATH = File.join(Rails.root,'lib','tmp')

  desc "Configuração de ambiente de desenvolvimento. "
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_default_admin)
      %x(rails dev:add_extras_admins)
      %x(rails dev:add_default_user)
      %x(rails dev:add_subjects)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    show_spinner("Adicionando administrador padrão...") do
      Admin.create!(
        email: 'admin@admin.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona administradores extras"
  task add_extras_admins: :environment do
    show_spinner("Adicionando administradores extras...") do
      10.times do |i|
        Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
      end
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    show_spinner("Adicionando usuário padrão...") do
      User.create!(
        email: 'user@user.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona assuntos padrões"
  task add_subjects: :environment do
    show_spinner("Adicionando administrador padrão...") do
      file_name = 'subjects.txt'
      file_path = File.join(DEFAULT_FILES_PATH,file_name)

      File.open(file_path, 'r').each do |line|
        Subject.create!(description: line.strip)
      end
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end

end

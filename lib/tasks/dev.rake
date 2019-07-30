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
      %x(rails dev:add_answer_questions)
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
    show_spinner("Adicionando Assuntos padrão...") do
      file_name = 'subjects.txt'
      file_path = File.join(DEFAULT_FILES_PATH,file_name)

      File.open(file_path, 'r').each do |line|
        Subject.create!(description: line.strip)
      end
    end
  end
  desc "Adiciona perguntas e respostas"
  task add_answer_questions: :environment do
    show_spinner("Adicionando perguntas e respostas...") do
      Subject.all.each do |subject|
        rand(1..5).times do |i|

          params = create_questions_params(subject)
          answers_array = params[:question][:answers_attributes]

          add_answers(answers_array)

          elect_true_answer(answers_array)

          Question.create!(params[:question])
        end
      end
    end
  end

  private

  def create_questions_params(subject = Subject.all.sample)
    { 
      question: 
      {
        description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
        subject: subject,
        answers_attributes: []
      }
    }
  end

  def create_answer_params(correct = false)
    { description: Faker::Lorem.sentence, correct: correct }
  end

  def add_answers(answers_array = [])
    rand(2..5).times do |j|
      answers_array.push(
        create_answer_params
      )
    end
  end

  def elect_true_answer(answers_array = [])
    selected_index = rand(answers_array.size)
    answers_array[selected_index] = create_answer_params(true)
  end
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end

end

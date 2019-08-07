module SiteHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      "Ultimas Perguntas ..."
    when 'questions'
      "Resultado(s) para o termo \"#{params[:term]}\": #{@search_count} pergunta(s) encontrado(s)."
    when 'subject'
      "Filtro: #{params[:subject]} - #{@search_subject_count} encontrado(s)."
    end
  end
  
end

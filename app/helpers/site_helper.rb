module SiteHelper
  
  def msg_jumbotron
    case params[:action]
    when 'index'
      "Ultimas Perguntas ..."
    when 'questions'
      "Resultado(s) para o termo \"#{params[:term]}\": #{@search_count} pergunta(s) encontrado(s)."
    when 'subject'
      "#{params[:subject]}"
    end
  end
  
end

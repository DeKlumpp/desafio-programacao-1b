class ProdutoController < ApplicationController
  def new
    if params[:file]
      lines = params[:file].tempfile.readlines.map(&:chomp) #readlines from file & removes newline symbol
      lines.shift #removendo primeira linha
      lines.each do |l|
        m = l.force_encoding("UTF-8").split("\t") #encondig e split
        Produto.create ({:comprador => m[0], :descricao => m[1], :preco => m[2],
                :quantidade => m[3], :endereco => m[4], :fornecedor  => m[5]})
        end
     end
     redirect_to :action => 'show'
   end

   def show
    @produtos = Produto.all

    sum = 0;
    @produtos.each do |p|
        sum += p.preco
    end
    @sum = sum #soma da receita bruta
  end
end

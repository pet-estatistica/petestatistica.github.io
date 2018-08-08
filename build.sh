hugo version

firefox http://localhost:1313/
hugo server

# Compila md para html.
Rscript -e\
        "library(rmarkdown); \
         render('./content/dsbd-content.md',\
                output_format = 'html_fragment',\
                output_dir = './themes/hugo-universal-theme/layouts/partials/')"

# Transfere.
mv -v dsbd-content.html ./themes/hugo-universal-theme/layouts/partials/

# Usando uma versão mais recente do hugo.
# Visitei:
# firefox https://github.com/gohugoio/hugo/releases
# Baixei:
# wget https://github.com/gohugoio/hugo/releases/download/v0.31.1/hugo_0.31.1_Linux-64bit.deb -P ~/Downloads
# Instalei:
# sudo dpkg -i ~/Downloads/hugo_0.31.1_Linux-64bit.deb

# Encontra onde está e exibe versão para confirmar.
whereis hugo
/usr/local/bin/hugo version

pwd
# Roda hugo server.
/usr/local/bin/hugo server

# Roda hugo para gerar pasta pública.
/usr/local/bin/hugo

# Arquivos de estilo do tema.
find -name *.css
# Colocar CSS no
# ./themes/hugo-universal-theme/static/css/style.default.css
(find-file "/home/walmes/repos/dsbd/themes/hugo-universal-theme/static/css/style.default.css")

# Imagens da parte estática do site estão em
# /home/walmes/repos/dsbd/themes/hugo-universal-theme/static/img

# Exibe o tamanho das imagens.
identify ./static/img/instructors/*

# https://superuser.com/questions/275476/square-thumbnails-with-imagemagick-convert
# cd ./static/img/icons/
# identify *
# ls
# mkdir bkp/
# mv -v * bkp/
# ls bkp
# rm *.png
# for pic in `ls bkp`; do
#     filename="${pic%.*}"
#     echo $filename
#     convert bkp/$pic[180x] $filename.png
#     convert $filename.png -gravity center -extent 180x180 +profile "*" $filename.png
# done

#-----------------------------------------------------------------------
# Deploy.

# Gera o diretório public/
hugo

# Transfere arquivos.
rsync -avzp ./public/* --progress ${USER}@${PATAXO}:~/public_html/dsbd/

# Abre no navegador.
firefox leg.ufpr.br/~walmes/dsbd


cd gfp_orcamento\scr
docker kill container_gfp_orcamento
docker rmi image_gfp_orcamento
docker build --tag image_gfp_orcamento .
docker run -d -p 5001:5001 --rm --name container_gfp_orcamento image_gfp_orcamento
cd ..\..

cd gfp_movimento_financeiro\scr
docker kill container_gfp_movimento_financeiro
docker rmi image_gfp_movimento_financeiro
docker build --tag image_gfp_movimento_financeiro .
docker run -d -p 5002:5002 --rm --name container_gfp_movimento_financeiro image_gfp_movimento_financeiro
cd ..\..


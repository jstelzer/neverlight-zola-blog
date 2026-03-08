# Neverlight moto blog — Zola + Cloudflare Pages

# Build the site
build:
    zola build

# Start local dev server with live reload
serve:
    zola serve --port 1112

# Build and deploy to Cloudflare Pages
deploy: build
    wrangler pages deploy public/ --project-name moto-blog

# Deploy without rebuilding
deploy-only:
    wrangler pages deploy public/ --project-name moto-blog

# Check what the live site is serving
check:
    @curl -sI https://moto-blog.neverlight.com | head -5

# List deployments
deployments:
    wrangler pages deployment list --project-name moto-blog

# Static site with Zola and GitHub Pages

This repo contains a GitHub Action that will build the site from source with Zola, triggered by push to the main branch, and push the results to the gh-pages branch.

In the repository settings make sure that you configure GitHub Pages to deploy from that branch and set up your custom domain. It only works on public repos on the free plan. It works with apex domains and subdomains equally well, and supports SSL automatically.

You probably need to configure a token secret so the action can push to your branch.

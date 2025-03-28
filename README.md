# Deploying to Cloudflare Pages

This guide will walk you through deploying your Zola site to Cloudflare Pages with automatic builds on push.

## Prerequisites

- A Cloudflare account (sign up at [https://dash.cloudflare.com/sign-up](https://dash.cloudflare.com/sign-up) if you don't have one)
- Your Zola site repository on GitHub

## Step 1: Log in to Cloudflare Dashboard

1. Go to [https://dash.cloudflare.com/](https://dash.cloudflare.com/) and log in to your account.

## Step 2: Set up a Cloudflare Pages project

1. In the Cloudflare dashboard, click on "Pages" in the left sidebar.
2. Click on "Create a project".
3. Select "Connect to Git".
4. Connect your GitHub account if you haven't already.
5. Select the repository containing your Zola site (`kovari.cc`).
6. Click "Begin setup".

## Step 3: Configure your build settings

1. In the "Set up builds and deployments" section, configure the following settings:

   - **Project name**: `kovari-cc` (or any name you prefer)
   - **Production branch**: `main` (or your default branch)
   - **Framework preset**: Zola
   - **Build output directory**: `public`
   - **Environment variables (advanced)**:
     - Add a variable named `UNSTABLE_PRE_BUILD` with the value `asdf plugin add zola https://github.com/salasrod/asdf-zola && asdf install zola 0.20.0 && asdf global zola 0.20.0`

2. Click "Save and Deploy".

## Step 4: Wait for the initial build

1. Cloudflare Pages will now clone your repository and build your site.
2. This process may take a few minutes for the first deployment.
3. Once completed, you'll see a success message with a URL where your site is deployed (typically `https://your-project-name.pages.dev`).

## Step 5: Configure your custom domain (optional)

If you want to use your custom domain (`kovari.cc`):

1. In your project's Pages dashboard, go to the "Custom domains" tab.
2. Click "Set up a custom domain".
3. Enter your domain name (`kovari.cc`).
4. Follow the instructions to verify domain ownership and configure DNS settings.
   - If your domain is already managed by Cloudflare, this will be simple.
   - If not, you'll need to update your DNS settings at your domain registrar.

## Step 6: Automatic deployments

Now, whenever you push changes to your GitHub repository:

1. Cloudflare Pages will automatically detect the changes.
2. It will build your site using the configuration you provided.
3. Once the build is successful, it will deploy the updated site.

You can monitor deployments in the Cloudflare Pages dashboard under your project.

## Troubleshooting

If your build fails:

1. Check the build logs in the Cloudflare Pages dashboard.
2. Verify that your Zola site builds locally with `zola build`.
3. Make sure all Git submodules are properly committed to your repository. If you're using a theme as a submodule, ensure you've committed the submodule reference with `git add themes/your-theme && git commit -m "Add theme as submodule"`.
4. Verify that the `UNSTABLE_PRE_BUILD` environment variable is correctly set to install Zola.
5. If you're still having issues, try building locally with the same commands that Cloudflare Pages uses.

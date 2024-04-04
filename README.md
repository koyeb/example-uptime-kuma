<div align="center">
  <a href="https://koyeb.com">
    <img src="https://www.koyeb.com/static/images/icons/koyeb.svg" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">Koyeb Serverless Platform</h3>
  <p align="center">
    Deploy <code>Uptime Kuma</code> on Koyeb
    <br />
    <a href="https://koyeb.com">Learn more about Koyeb</a>
    ·
    <a href="https://koyeb.com/docs">Explore the documentation</a>
    ·
    <a href="https://koyeb.com/tutorials">Discover our tutorials</a>
  </p>
</div>


## About Koyeb and the Uptime Kuma example application

Koyeb is a developer-friendly serverless platform to deploy apps globally. No-ops, servers, or infrastructure management.

This repository contains is designed to show how Uptime Kuma can be deployed to Koyeb.  The image this repository builds bundles [Uptime Kuma](https://github.com/louislam/uptime-kuma), a service monitoring tool, with  [Litestream](https://litestream.io/), a tool for replicating SQLite databases to object storage buckets continuously.

You can follow the [associated tutorial](https://www.koyeb.com/tutorials/monitor-your-websites-and-apps-using-uptime-kuma) to learn more about the two components work and how to configure them effectively.

## Getting Started

Follow the steps below to deploy and run the Uptime Kuma to your Koyeb account.

### Requirements

To use this repository, you need:

* A Koyeb account: to build the Docker image and run the Dockerized applications.  If you don't already have an account, you can [sign-up for free](https://app.koyeb.com/auth/signup).
* A [Backblaze account](https://secure.backblaze.com/user_signin.htm): Used to store Uptime Kuma's SQLite database files.  From your Backblaze account, you need to [create a bucket](https://www.backblaze.com/docs/cloud-storage-developer-quick-start-guide#create-a-bucket) and an [application key](https://www.backblaze.com/docs/cloud-storage-developer-quick-start-guide#create-an-application-key).
* (Optional) a [Mailgun account](https://www.mailgun.com/): to send notification emails when monitoring detects a problem with a service.  From your Mailgun account, you need to configure an [authorized recipient email address](https://help.mailgun.com/hc/en-us/articles/217531258-Authorized-Recipients).

### Deploy using the Koyeb button

The fastest way to deploy Uptime Kuma is to click the **Deploy to Koyeb** button below.

[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?name=uptime-kuma-litestream&type=git&repository=koyeb/example-uptime-kuma&branch=main&builder=dockerfile&env[UPTIME_KUMA_PORT]=8000&env[LITESTREAM_ACCESS_KEY_ID]=REPLACE_ME&env[LITESTREAM_SECRET_ACCESS_KEY]=REPLACE_ME&env[LITESTREAM_BUCKET]=REPLACE_ME&env[LITESTREAM_PATH]=uptime-kuma&env[LITESTREAM_URL]=REPLACE_ME&env[LITESTREAM_REGION]=REPLACE_ME&ports=8000;http;/)

Clicking on this button brings you to the Koyeb App creation page with most of the settings pre-configured to launch this application.  You will need to replace the values for the following variables:

* `LITESTREAM_ACCESS_KEY_ID`: Set to the `keyID` for the Backblaze API key you created.
* `LITESTREAM_SECRET_ACCESS_KEY`: Set this to the `applicationKey` for the Backblaze API key you created.
* `LITESTREAM_BUCKET`: Set to the bucket name you created on Backblaze.
* `LITESTREAM_PATH`: Set to the directory name you want to use to store your Uptime Kuma database information.  All objects created by Litestream will be placed within this directory within the bucket.
* `LITESTREAM_URL`: Prepend `https://` to your Backblaze endpoint.  For example, if your endpoint is `s3.eu-central-003.backblazeb2.com`, enter `https://s3.eu-central-003.backblazeb2.com` for this field.
* `LITESTREAM_REGION`: Set this to the second component of your Backblaze endpoint.  For example, if your endpoint is `s3.eu-central-003.backblazeb2.com`, the region for this field would be `eu-central-003`.

_To modify this application example, you will need to fork this repository. Checkout the [fork and deploy](#fork-and-deploy-to-koyeb) instructions._

### Fork and deploy to Koyeb

If you want to customize and enhance this application, you need to fork this repository.

If you used the **Deploy to Koyeb** button, you can simply link your service to your forked repository to be able to push changes.  Alternatively, you can manually create the application as described below.

On the [Koyeb Control Panel](https://app.koyeb.com/), on the **Overview** tab, click the **Create Web Service** button to begin.

1. Select **GitHub** as the deployment method.
2. Choose the repository containing your application code.
3. In the **Builder** section, select **Dockerfile**.
4. In the **Environment variables** section, and click the **Add aariable** button to fill in the environment variables outlined above.
5. Choose a name for your App and Service, for example `uptime-kuma-litestream`, and click **Deploy**.

A container image for Uptime Kuma will be built and a container will be deployed to Koyeb.  You can follow the build process as the repository is cloned, built, and deployed.  Once the deployment is complete, it will be accessible using the Koyeb subdomain for your service.

## Contributing

If you have any questions, ideas or suggestions regarding this application sample, feel free to open an [issue](//github.com/koyeb/example-uptime-kuma/issues) or fork this repository and open a [pull request](//github.com/koyeb/example-uptime-kuma/pulls).

## Contact

[Koyeb](https://www.koyeb.com) - [@gokoyeb](https://twitter.com/gokoyeb) - [Slack](http://slack.koyeb.com/)

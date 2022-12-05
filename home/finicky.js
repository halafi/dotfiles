module.exports = {
  defaultBrowser: "Firefox",
  options: {
    hideIcon: true, 
    checkForUpdate: true,
    logRequests: false
  },
  rewrite: [
    {
      // Redirect all urls to use https
      match: ({ url }) => url.protocol === "http",
      url: { protocol: "https" }
    }
  ],
  handlers: [
    {
      match: ({ url }) => url.host === "zenhub.com" || url.host === "app.zenhub.com" || url.host === "github.com",
      browser: "Google Chrome"
    },
    {
      // Open any url that includes the string "workplace" in Firefox
      match: /drive.google/,
      browser: "Google Chrome"
    }
  ]
};

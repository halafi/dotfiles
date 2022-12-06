const WORK_RELATED_HOSTS = [
  "zenhub.com",
  "app.zenhub.com",
  "github.com",
  "zoom.us",
  "cloud.google.com",
  "chrome.google.com",
  "drive.google.com",
  "meet.google.com",
  "figma.com",
];

module.exports = {
  defaultBrowser: "Firefox",
  options: {
    hideIcon: true,
    checkForUpdate: true,
    logRequests: false,
  },
  rewrite: [
    {
      // Redirect all urls to use https
      match: ({ url }) => url.protocol === "http",
      url: { protocol: "https" },
    },
  ],
  handlers: [
    {
      match: ({ url }) => WORK_RELATED_HOSTS.includes(url.host),
      browser: "Google Chrome",
    },
    {
      // Open any url that includes the string "workplace" in Firefox
      match: /archipelo/, // handle e.g. notion links
      browser: "Google Chrome",
    },
  ],
};

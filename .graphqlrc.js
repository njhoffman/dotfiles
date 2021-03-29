module.exports = {
  projects: {
    default: {
      schema:
        '/home/nicholas/projects/spadash/apps/admin-app/server/schema.graphql',
      documents:
        '/home/nicholas/projects/spadash/app/admin-app/client/**/*.graphql',
    },
    other: {
      schema: 'http://localhost:3001',
    },
  },
};

// import { loadConfig } from 'graphql-config'; // 3.0.0 or later!
//
// await startServer({
//   method: 'node',
//   // or instead of configName, an exact path (relative from rootDir or absolute)
//
//   // deprecated for: loadConfigOptions.rootDir. root directory for graphql config file(s), or for relative resolution for exact `filePath`. default process.cwd()
//   // configDir: '',
//   loadConfigOptions: {
//     // any of the options for graphql-config@3 `loadConfig()`
//
//     // rootDir is same as `configDir` before, the path where the graphql config file would be found by cosmic-config
//     rootDir: 'config/',
//     // or - the relative or absolute path to your file
//     filePath: 'exact/path/to/config.js (also supports yml, json)',
//     // myPlatform.config.js/json/yaml works now!
//     configName: 'myPlatform',
//   },
// });

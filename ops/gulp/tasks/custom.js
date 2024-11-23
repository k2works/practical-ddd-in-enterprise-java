const {src, dest, series} = require("gulp");
const fs = require('fs-extra');
const { exec } = require('child_process');
const jig = {
    build: (cb) => {
        fs.ensureDir("./public/docs/jig").then(() => {
            src("./docs/jig/**").pipe(dest("./public/docs/jig"));
        });
        cb();
    },
    runJigCli: (cb) => {
        exec('./run_jig_cli.sh', (err, stdout, stderr) => {
            if (err) {
                console.error(`Error: ${stderr}`);
                cb(new Error("Error running run_jig_cli.sh"));
            } else {
                console.log(`Output: ${stdout}`);
                cb();
            }
        });
    },
    copy: (cb) => {
        fs.ensureDir("./public/docs/jig").then(() => {
            src("./docs/jig/**").pipe(dest("./public/docs/jig"));
        });
        cb();
    },
    clean: async (cb) => {
        await fs.remove("./public/docs/jig");
        cb();
    },
}

exports.jigBuildTasks = () => {
    return series(jig.clean, jig.build, jig.runJigCli, jig.copy);
}

exports.jigCopyTasks = () => {
    return series(jig.copy);
}
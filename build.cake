
Action<string> buildSwift = (name) => {
    var args = String.Format("build -C swift/{0}", name);
    StartProcess("swift", new ProcessSettings {
        Arguments = args
    });
};

Action<string, string> runSwift = (name,args) => {
    var command = String.Format("swift/{0}/.build/debug/{0}", name);
    StartProcess(command, new ProcessSettings {
        Arguments = args
    });
};

Task("Default").Does(() => {});

Task("Build-ActiveWindow").Does(() => {
    buildSwift("ActiveWindow");
});

Task("Build-ScreenSize").Does(() => {
    buildSwift("ScreenSize");
});

Task("Build-ResizeWindow").Does(() => {
    buildSwift("ResizeWindow");
});

Task("Run-ResizeWindow")
    .IsDependentOn("Build-ResizeWindow")
    .Does(() => {
        runSwift("ResizeWindow", ""); 
});

var target = Argument("target", "default");
RunTarget(target);
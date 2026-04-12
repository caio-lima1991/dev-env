vim.pack.add({ "https://github.com/mfussenegger/nvim-jdtls" })

local function jdtls_autostart()
    for _, client in pairs(vim.lsp.get_clients({ bufnr = 0, name = "jdtls" })) do
        return
    end

    local config = GET_JDTLS_CONFIG()
    require("jdtls").start_or_attach(config)
end

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("JDTLS_LSP_START", { clear = true }),
    pattern = "java",
    callback = jdtls_autostart,
    desc = "Start nvim-jdtls for Java files",
})

local dap = require("dap")

dap.configurations.java = {
    {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
    },
}

GET_JDTLS_CONFIG = function()
    local jdtls = require("jdtls")
    local mason = vim.fn.stdpath("data") .. "/mason/packages/"
    local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.expand("~/.jdtls-workspace/") .. project_name

    local lombok_path = jdtls_path .. "lombok.jar"
    local m2_repo = vim.fn.expand("~/.m2/repository")
    local os_name = vim.loop.os_uname().sysname

    local cmd = {
        "java",

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        "-javaagent:" .. lombok_path,

        "-jar",
        vim.fn.glob(jdtls_path .. "plugins/org.eclipse.equinox.launcher_*.jar"),

        "-configuration",
        jdtls_path .. "config_" .. (os_name == "Windows_NT" and "win" or os_name == "Linux" and "linux" or "mac"),
        "-data",
        workspace_dir,
    }

    local config = {
        cmd = cmd,
        root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw", "pom.xml" }),

        settings = {
            java = {
                eclipse = {
                    downloadSources = true,
                },
                maven = {
                    settingsFile = m2_repo .. "/settings.xml",
                },
            },
        },

        on_attach = function()
            jdtls.setup_dap({ hotcodereplace = "auto" })
        end,
    }

    local bundles = {
        vim.fn.glob(mason .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
    }
    config["init_options"] = {
        bundles = bundles,
    }

    jdtls.setup_dap({ hotcodereplace = "auto", config_overrides = {} })

    return config
end
-- return {
--     {
--         "mfussenegger/nvim-jdtls",
--     },
--
--     {
--         "mfussenegger/nvim-dap",
--         ft = "java",
--
--         dependencies = {
--             { "mason-org/mason.nvim" },
--         },
--
--         opts = function()
--     },
-- }

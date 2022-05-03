using DevOpsChallenge.SalesApi;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using System;

// Set console title
Console.Title = "DevOps Challenge Sales API";

// Build and run host
await Host.CreateDefaultBuilder(args)
    .ConfigureAppConfiguration(config =>
    {
        config.AddEnvironmentVariables("APP_");
    })
    .ConfigureWebHostDefaults(webBuilder =>
    {
        webBuilder.UseKestrel((options)=>{
            // Do not add the Server HTTP header.
            options.AddServerHeader = false;
        });
        webBuilder.UseStartup<Startup>();
    })
    .RunConsoleAsync();
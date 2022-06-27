using Assessment.Configs;
using DataAccess.EFCore.AppDbContext;
using Domain.Configs;
using Domain.Helpers;
using Domain.Helpers.Interface;
using Domain.Repository;
using Domain.Repository.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Serilog;

var builder = WebApplication.CreateBuilder(args);

//Logger
Log.Logger = new LoggerConfiguration().CreateBootstrapLogger();
builder.Host.UseSerilog(((ctx, lc) => lc
.ReadFrom.Configuration(ctx.Configuration)));

// Add services to the container.
builder.Services.AddControllers(); 

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.EnableAnnotations();
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Assessment", Version = "v1" });
});

//Application Database Context
builder.Services.AddDbContext<CustomerDbContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("CustomerDbConnection"), b => b.MigrationsAssembly("Assessment"));
});

//services
builder.Services.AddScoped<ICustomerRepository, CustomerRepository>();
builder.Services.AddScoped<IOTPRepository, OTPRepository>();
builder.Services.AddScoped<IPasswordSecurityRepository, PasswordSecurityRepository>();
builder.Services.AddScoped<ISMSRepository, SMSRepository>();
builder.Services.AddScoped<IStateRepository, StateRepository>();
builder.Services.AddScoped<IHttpClientRepository, HttpClientRepository>();
builder.Services.AddScoped<IChecker, Checkers>();


//Configuration services
builder.Services.Configure<SMSBody>(builder.Configuration.GetSection("SMSBody"));
builder.Services.Configure<Urls>(builder.Configuration.GetSection("Urls"));
builder.Services.Configure<Subscription>(builder.Configuration.GetSection("Subscription"));


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();

using Domain.Configs;
using Domain.Models.Response;
using Domain.Repository.Interface;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository
{
    public class HttpClientRepository : IHttpClientRepository
    {
        private readonly Urls _urls;
        private readonly Subscription _subscription;
        private readonly ILogger<HttpClientRepository> _logger;
        public HttpClientRepository(IOptions<Urls> urlsOptions, ILogger<HttpClientRepository> logger, IOptions<Subscription> subscription)
        {
            _urls = urlsOptions.Value;
            _logger = logger;
            _subscription = subscription.Value;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public async Task<GetAllBanksResponse> GetBanksAsync()
        {
            try
            {
                using (var httpClient = new HttpClient())
                {
                    httpClient.BaseAddress = new Uri(_urls.BaseUrl);
                    httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    httpClient.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", _subscription.PrimaryKey);

                    var apiResponse = await httpClient.GetAsync(_urls.GetAllBanksEndpoint).Result.Content.ReadAsStringAsync();
                    var response = JsonConvert.DeserializeObject<GetAllBanksResponse>(apiResponse);

                    return response;

                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return new GetAllBanksResponse();
            }
        }
    }
}

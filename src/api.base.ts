import fetch, { BodyInit, Headers, Response } from 'node-fetch';

/** Class to configure an API */
export class Configuration {
  /**
   *
   * @type {string}
   * @memberof Configuration
   * @example https://api.alphaflashcards.com
   * @description The base url to hit against
   */
  baseURL: string;
  /**
   *
   * @type {string}
   * @memberof Configuration
   * @example 96fd73a4-36d2-45da-b7b2-19ec7b4b3dc5
   * @description The api key to authenticate against the api with
   */
  apiKey: string;

  /**
   *
   * @type {string}
   * @memberof Configuration
   * @example Bearer
   * @description The type of authorization to use
   */
  authType: string;

  /**
   * Create a configuration.
   * @param {string} baseURL - The base url.
   * @param {string} apiKey - The api key.
   * @param {string} authType - The authorization type.
   */
  constructor(baseURL: string, apiKey: string, authType = 'Bearer') {
    this.baseURL = baseURL;
    this.apiKey = apiKey;
    this.authType = authType;
  }
}

export interface RequestOptions {
  method: string;

  body?: BodyInit;

  headers: Headers;
}

export class BaseApi {
  /**
   *
   * @type {Configuration}
   * @memberof BaseApi
   * @description The configuration object with information around url and api key
   */
  protected configuration: Configuration;

  /**
   * @param {Configuration} configuration - The configuration object.
   */
  constructor(configuration: Configuration) {
    this.configuration = configuration;
  }

  /**
   * Requests external data
   * @constructor
   * @param {string} url - The url to combine with the base url
   * @param {any} requestParameters - The json body to send when requesting data
   */
  async requestData(
    url: string,
    method: 'GET' | 'POST' | 'PUT',
    requestParameters?: any,
  ): Promise<Response> {
    const headers = new Headers();
    headers.append('Content-Type', 'application/json');
    headers.append(
      'Authorization',
      `${this.configuration.authType} ${this.configuration.apiKey}`,
    );

    const options: Partial<RequestOptions> = {
      headers: headers,
      method: method,
    };

    if (requestParameters) options.body = JSON.stringify(requestParameters);

    const fullUrl = `${this.configuration.baseURL}${url}`;
    console.info(
      `Fetch URL %s [%s|%j]`,
      fullUrl,
      method,
      requestParameters || '',
    );

    const request = await fetch(fullUrl, options);

    return request;
  }
}

/*
 * Far from being an extensive test of the module loader, the first step here
 * is to perform a basic sanity check of our built-in modules.
 */

const assert = require('assert');
const buffer = require('buffer');
const child_process = require('child_process');
const cluster = require('cluster');
const crypto = require('crypto');
const dgram = require('dgram');
const dns = require('dns');
const domain = require('domain');
const EventEmitter = require('events');
const fs = require('fs');
const http = require('http');
const https = require('https');
const net = require('net');
const os = require('os');
const path = require('path');
const punycode = require('punycode');
const querystring = require('querystring');
const readline = require('readline');
const repl = require('repl');
const stream = require('stream');
const string_decoder = require('string_decoder');
const timers = require('timers');
const tls = require('tls');
const tty = require('tty');
const url = require('url');
const util = require('util');
const v8 = require('v8');
const vm = require('vm');
const zlib = require('zlib');

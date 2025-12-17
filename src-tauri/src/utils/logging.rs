//! Logging module
//!
//! This module handles application logging configuration.

use tauri::{App, Manager};

use anyhow::{Context, Result};
use tracing::Level;
use std::{fs, path::Path};
use tracing_subscriber::{
    fmt,
    layer::{Layer, SubscriberExt},
    prelude::*,
    registry::Registry,
    util::SubscriberInitExt,
    EnvFilter,
};
use tracing_appender::{non_blocking, rolling::{RollingFileAppender, Rotation}};

pub fn init_tracing(app: &mut App) -> Result<()> {
    let config = app.state::<crate::config::AppConfig>();
    let log_config = &config.logging;

    // let filter_layer = EnvFilter::try_new(log_config.log_level.as_str())?
    //     .add_directive("h2=warn".parse()?)
    //     .add_directive("hyper=info".parse()?);

    // // 2. 控制台层
    // let console_layer = fmt::layer()
    //     .with_ansi(true)
    //     .with_timer(fmt::time::LocalTime::rfc_3339());
    // // 3. 文件层 + 旋转
    // let path_str = log_config.log_file_path.as_str();
    // let file_name = log_config.log_file_name.as_str();
    // let log_dir = Path::new(&path_str);
    // crate::utils::fs::init_dir(&path_str)?;
    // let file_appender = RollingFileAppender::builder()  
    //     .rotation(Rotation::DAILY)  
    //     .filename_prefix(file_name)
    //     .filename_suffix("log")
    //     .max_log_files(log_config.log_file_rotation.log_file_max_backups.try_into().unwrap_or(5))
    //     .build(log_dir)
    //     .context("Failed to build file appender")?;
    // let (non_blocking, _guard) = tracing_appender::non_blocking(file_appender);
    // let file_layer = fmt::layer()
    //     .with_writer(non_blocking)
    //     .with_ansi(false)
    //     .with_timer(fmt::time::LocalTime::rfc_3339());
    // 4. 初始化（链式 with 安全）
    // Registry::default().with(filter_layer).with(file_layer).with(console_layer).init();
    tracing::info!(
        level = log_config.log_level,
        console = log_config.console,
        "Tracing initialized successfully"
    );
    Ok(())
}


/// Log a message at debug level
pub fn debug(message: &str) {
    tracing::debug!("{}", message);
}

/// Log a message at info level
pub fn info(message: &str) {
    tracing::info!("{}", message);
}

/// Log a message at warn level
pub fn warn(message: &str) {
    tracing::warn!("{}", message);
}

/// Log a message at error level
pub fn error(message: &str) {
    tracing::error!("{}", message);
}

/// Log a message with structured fields
pub fn log_with_fields(level: Level, message: &str, _fields: &[(&str, &str)]) {
    match level {
        Level::DEBUG => tracing::debug!("{}", message),
        Level::INFO => tracing::info!("{}", message),
        Level::WARN => tracing::warn!("{}", message),
        Level::ERROR => tracing::error!("{}", message),
        Level::TRACE => tracing::trace!("{}", message),
    }
}

/// Create a span for tracing
pub fn create_span(name: &'static str) -> tracing::Span {
    tracing::info_span!("{}", name)
}
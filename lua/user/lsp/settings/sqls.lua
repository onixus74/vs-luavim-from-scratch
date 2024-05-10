return {
	settings = {
		sqls = {
			connections = {
				{
					alias = "copia_dev",
					driver = "postgresql",
					dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=postgres dbname=copia_dev sslmode=disable",
				},
				{
					alias = "clickhouse",
					driver = "mysql",
					dataSourceName = "default:@tcp(127.0.0.1:8123)/default",
				},
			},
		},
	},
}

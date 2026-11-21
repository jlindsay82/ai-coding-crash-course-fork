PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_lessons` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`module_id` integer NOT NULL,
	`title` text NOT NULL,
	`content` text,
	`video_url` text,
	`github_repo_url` text,
	`position` integer NOT NULL,
	`duration_minutes` integer DEFAULT 0 NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`module_id`) REFERENCES `modules`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
INSERT INTO `__new_lessons`("id", "module_id", "title", "content", "video_url", "github_repo_url", "position", "duration_minutes", "created_at") SELECT "id", "module_id", "title", "content", "video_url", "github_repo_url", "position", "duration_minutes", "created_at" FROM `lessons`;--> statement-breakpoint
DROP TABLE `lessons`;--> statement-breakpoint
ALTER TABLE `__new_lessons` RENAME TO `lessons`;--> statement-breakpoint
PRAGMA foreign_keys=ON;
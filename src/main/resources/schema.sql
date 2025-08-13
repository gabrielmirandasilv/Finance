CREATE TABLE IF NOT EXISTS `users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL UNIQUE,
  `password_hash` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `earnings` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NOT NULL,
  `value` DECIMAL(10, 2) NOT NULL,
  `date` DATE NOT NULL,
  `type` ENUM('FIXED', 'VARIABLE') NOT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  -- Índice para otimizar buscas por user_id
  INDEX `fk_earnings_user_id_idx` (`user_id` ASC) VISIBLE,
  -- Define a chave estrangeira para o relacionamento com a tabela 'users'
  CONSTRAINT `fk_earnings_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `payoffs` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NOT NULL,
  `value` DECIMAL(10, 2) NOT NULL,
  `date` DATE NOT NULL,
  `type` ENUM('FIXED', 'VARIABLE') NOT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  -- Índice para otimizar buscas por user_id
  INDEX `fk_payoffs_user_id_idx` (`user_id` ASC) VISIBLE,
  -- Define a chave estrangeira para o relacionamento com a tabela 'users'
  CONSTRAINT `fk_payoffs_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;
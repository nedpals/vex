// Based on the work by @BenStigsen on the threads module
// https://github.com/BenStigsen/threads/blob/main/threads.v
module server

[params]
pub struct ThreadManager {
	limit int = 10
mut:
	channel chan bool
	count   int
	skip    int
}

fn (mut manager ThreadManager) add() bool {
	mut new := false
	_ := manager.channel.try_pop(mut new)

	if new {
		if manager.skip > 0 {
			manager.skip -= 1
		} else if manager.count > 0 {
			manager.count -= 1
		}
	}

	if manager.count < manager.limit && int(manager.channel.len) < manager.limit {
		manager.count += 1
		return true
	}

	return false
}

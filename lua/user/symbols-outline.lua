local status_ok, symbols-outline = pcall(require, "symbols-outline")
if not status_ok then
    return
end

symbols-outline.setup()

local aghpb = require("aghpb");

local category = arg[1];

if category == "--list" then
    local list = aghpb.categories();
    for _, e in pairs(list) do
        print(e);
    end

    return;
end

local save_dir = os.getenv("HOME") .. "/Pictures/Backgrounds";

local book = aghpb.random(category);

print("Name:       ", book.name);
print("Category:   ", book.category);
print("Date Added: ", book.date_added);

local filename = string.format("%s/aghpb-%s.png", save_dir, book.name:gsub(" ", "_"));

local file = assert(io.open(filename, "wb"));

file:write(book.image_bytes);
file:close();

os.execute(string.format("wal -i '%s'", filename));

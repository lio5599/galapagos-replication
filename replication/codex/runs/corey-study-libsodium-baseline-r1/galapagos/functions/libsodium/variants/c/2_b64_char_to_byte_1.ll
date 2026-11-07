; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 255
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and3 = and i32 %and, %sub2
  %4 = load i32, ptr %x, align 4
  %or4 = or i32 %4, %and3
  store i32 %or4, ptr %x, align 4
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %6
  %or7 = or i32 %sub5, %sub6
  %shr8 = lshr i32 %or7, 8
  %not9 = xor i32 %shr8, -1
  %and10 = and i32 %not9, 255
  %7 = load i32, ptr %u, align 4
  %sub11 = sub i32 %7, 97
  %add = add i32 %sub11, 26
  %and12 = and i32 %and10, %add
  %8 = load i32, ptr %x, align 4
  %or13 = or i32 %8, %and12
  store i32 %or13, ptr %x, align 4
  %9 = load i32, ptr %u, align 4
  %sub14 = sub i32 %9, 48
  %10 = load i32, ptr %u, align 4
  %sub15 = sub i32 57, %10
  %or16 = or i32 %sub14, %sub15
  %shr17 = lshr i32 %or16, 8
  %not18 = xor i32 %shr17, -1
  %and19 = and i32 %not18, 255
  %11 = load i32, ptr %u, align 4
  %sub20 = sub i32 %11, 48
  %add21 = add i32 %sub20, 52
  %and22 = and i32 %and19, %add21
  %12 = load i32, ptr %x, align 4
  %or23 = or i32 %12, %and22
  store i32 %or23, ptr %x, align 4
  %13 = load i32, ptr %u, align 4
  %xor = xor i32 %13, 43
  %sub24 = sub i32 0, %xor
  %shr25 = lshr i32 %sub24, 8
  %not26 = xor i32 %shr25, -1
  %and27 = and i32 %not26, 62
  %14 = load i32, ptr %x, align 4
  %or28 = or i32 %14, %and27
  store i32 %or28, ptr %x, align 4
  %15 = load i32, ptr %u, align 4
  %xor29 = xor i32 %15, 47
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %not32 = xor i32 %shr31, -1
  %and33 = and i32 %not32, 63
  %16 = load i32, ptr %x, align 4
  %or34 = or i32 %16, %and33
  store i32 %or34, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub35 = sub i32 0, %18
  %shr36 = lshr i32 %sub35, 8
  %not37 = xor i32 %shr36, -1
  %and38 = and i32 %not37, 255
  %19 = load i32, ptr %u, align 4
  %xor39 = xor i32 %19, 65
  %sub40 = sub i32 0, %xor39
  %shr41 = lshr i32 %sub40, 8
  %and42 = and i32 %shr41, 255
  %and43 = and i32 %and38, %and42
  %or44 = or i32 %17, %and43
  ret i32 %or44
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}

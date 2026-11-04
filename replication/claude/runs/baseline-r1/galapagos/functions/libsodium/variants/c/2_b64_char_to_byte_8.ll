; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %t = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 47
  %xor = xor i32 %sub, 0
  store i32 %xor, ptr %t, align 4
  %2 = load i32, ptr %u, align 4
  %xor1 = xor i32 %2, 47
  store i32 %xor1, ptr %t, align 4
  %3 = load i32, ptr %t, align 4
  %sub2 = sub i32 0, %3
  %shr = lshr i32 %sub2, 8
  %and = and i32 %shr, 255
  %xor3 = xor i32 %and, 255
  %and4 = and i32 %xor3, 63
  %4 = load i32, ptr %x, align 4
  %xor5 = xor i32 %4, %and4
  store i32 %xor5, ptr %x, align 4
  %5 = load i32, ptr %u, align 4
  %xor6 = xor i32 %5, 43
  store i32 %xor6, ptr %t, align 4
  %6 = load i32, ptr %t, align 4
  %sub7 = sub i32 0, %6
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  %and11 = and i32 %xor10, 62
  %7 = load i32, ptr %x, align 4
  %or = or i32 %7, %and11
  store i32 %or, ptr %x, align 4
  %8 = load i32, ptr %u, align 4
  %sub12 = sub i32 %8, 48
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  %9 = load i32, ptr %u, align 4
  %sub16 = sub i32 57, %9
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %xor19 = xor i32 %and18, 255
  %and20 = and i32 %xor15, %xor19
  store i32 %and20, ptr %t, align 4
  %10 = load i32, ptr %t, align 4
  %11 = load i32, ptr %u, align 4
  %add = add i32 %11, 4
  %and21 = and i32 %10, %add
  %12 = load i32, ptr %x, align 4
  %or22 = or i32 %12, %and21
  store i32 %or22, ptr %x, align 4
  %13 = load i32, ptr %u, align 4
  %sub23 = sub i32 %13, 97
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 %shr24, 255
  %xor26 = xor i32 %and25, 255
  %14 = load i32, ptr %u, align 4
  %sub27 = sub i32 122, %14
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  %xor30 = xor i32 %and29, 255
  %and31 = and i32 %xor26, %xor30
  store i32 %and31, ptr %t, align 4
  %15 = load i32, ptr %t, align 4
  %16 = load i32, ptr %u, align 4
  %sub32 = sub i32 %16, 71
  %and33 = and i32 %15, %sub32
  %17 = load i32, ptr %x, align 4
  %or34 = or i32 %17, %and33
  store i32 %or34, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %sub35 = sub i32 %18, 65
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr36, 255
  %xor38 = xor i32 %and37, 255
  %19 = load i32, ptr %u, align 4
  %sub39 = sub i32 90, %19
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %xor42 = xor i32 %and41, 255
  %and43 = and i32 %xor38, %xor42
  store i32 %and43, ptr %t, align 4
  %20 = load i32, ptr %t, align 4
  %21 = load i32, ptr %u, align 4
  %sub44 = sub i32 %21, 65
  %and45 = and i32 %20, %sub44
  %22 = load i32, ptr %x, align 4
  %or46 = or i32 %22, %and45
  store i32 %or46, ptr %x, align 4
  %23 = load i32, ptr %x, align 4
  %sub47 = sub i32 0, %23
  %shr48 = lshr i32 %sub47, 8
  %and49 = and i32 %shr48, 255
  %xor50 = xor i32 %and49, 255
  store i32 %xor50, ptr %t, align 4
  %24 = load i32, ptr %u, align 4
  %xor51 = xor i32 %24, 65
  %sub52 = sub i32 0, %xor51
  %shr53 = lshr i32 %sub52, 8
  %and54 = and i32 %shr53, 255
  %25 = load i32, ptr %t, align 4
  %and55 = and i32 %25, %and54
  store i32 %and55, ptr %t, align 4
  %26 = load i32, ptr %x, align 4
  %27 = load i32, ptr %t, align 4
  %or56 = or i32 %26, %27
  ret i32 %or56
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

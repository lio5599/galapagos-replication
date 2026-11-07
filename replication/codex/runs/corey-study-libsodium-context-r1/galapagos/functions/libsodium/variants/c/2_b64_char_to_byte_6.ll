; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 65
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %3
  %or = or i32 %sub1, %sub2
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %and3 = and i32 %sub, %and
  store i32 %and3, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 71
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %6
  %or7 = or i32 %sub5, %sub6
  %not8 = xor i32 %or7, -1
  %shr9 = lshr i32 %not8, 8
  %and10 = and i32 %shr9, 255
  %and11 = and i32 %sub4, %and10
  store i32 %and11, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 %7, -4
  %8 = load i32, ptr %u, align 4
  %sub13 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %9
  %or15 = or i32 %sub13, %sub14
  %not16 = xor i32 %or15, -1
  %shr17 = lshr i32 %not16, 8
  %and18 = and i32 %shr17, 255
  %and19 = and i32 %sub12, %and18
  store i32 %and19, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub20 = sub i32 0, %xor
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr22, 62
  store i32 %and23, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor24 = xor i32 %11, 47
  %sub25 = sub i32 0, %xor24
  %not26 = xor i32 %sub25, -1
  %shr27 = lshr i32 %not26, 8
  %and28 = and i32 %shr27, 63
  store i32 %and28, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %not29 = xor i32 %12, -1
  %13 = load i32, ptr %b, align 4
  %not30 = xor i32 %13, -1
  %and31 = and i32 %not29, %not30
  %14 = load i32, ptr %d, align 4
  %not32 = xor i32 %14, -1
  %and33 = and i32 %and31, %not32
  %15 = load i32, ptr %p, align 4
  %not34 = xor i32 %15, -1
  %and35 = and i32 %and33, %not34
  %16 = load i32, ptr %s, align 4
  %not36 = xor i32 %16, -1
  %and37 = and i32 %and35, %not36
  %not38 = xor i32 %and37, -1
  store i32 %not38, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %17
  %not40 = xor i32 %sub39, -1
  %shr41 = lshr i32 %not40, 8
  %and42 = and i32 %shr41, 255
  store i32 %and42, ptr %z, align 4
  %18 = load i32, ptr %u, align 4
  %xor43 = xor i32 %18, 65
  %sub44 = sub i32 0, %xor43
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  store i32 %and46, ptr %n, align 4
  %19 = load i32, ptr %x, align 4
  %not47 = xor i32 %19, -1
  %20 = load i32, ptr %z, align 4
  %21 = load i32, ptr %n, align 4
  %and48 = and i32 %20, %21
  %not49 = xor i32 %and48, -1
  %and50 = and i32 %not47, %not49
  %not51 = xor i32 %and50, -1
  ret i32 %not51
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

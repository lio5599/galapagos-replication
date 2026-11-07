; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/0_b64_byte_to_char_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/0_b64_byte_to_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %r = alloca i32, align 4
  %s = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  store i32 %and9, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor10 = xor i32 %4, 63
  %sub11 = sub i32 0, %xor10
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr12, 255
  store i32 %and13, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %not = xor i32 %5, -1
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %not14 = xor i32 %add, -1
  %or = or i32 %not, %not14
  %not15 = xor i32 %or, -1
  store i32 %not15, ptr %p, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %b, align 4
  %not16 = xor i32 %8, -1
  %or17 = or i32 %7, %not16
  %9 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %9, 71
  %not19 = xor i32 %add18, -1
  %or20 = or i32 %or17, %not19
  %not21 = xor i32 %or20, -1
  store i32 %not21, ptr %q, align 4
  %10 = load i32, ptr %b, align 4
  %11 = load i32, ptr %c, align 4
  %not22 = xor i32 %11, -1
  %or23 = or i32 %10, %not22
  %12 = load i32, ptr %x.addr, align 4
  %add24 = add i32 %12, -4
  %not25 = xor i32 %add24, -1
  %or26 = or i32 %or23, %not25
  %not27 = xor i32 %or26, -1
  store i32 %not27, ptr %r, align 4
  %13 = load i32, ptr %d, align 4
  %or28 = or i32 %13, -44
  %not29 = xor i32 %or28, -1
  store i32 %not29, ptr %s, align 4
  %14 = load i32, ptr %e, align 4
  %or30 = or i32 %14, -48
  %not31 = xor i32 %or30, -1
  store i32 %not31, ptr %t, align 4
  %15 = load i32, ptr %p, align 4
  %16 = load i32, ptr %q, align 4
  %or32 = or i32 %15, %16
  %17 = load i32, ptr %r, align 4
  %or33 = or i32 %or32, %17
  %18 = load i32, ptr %s, align 4
  %or34 = or i32 %or33, %18
  %19 = load i32, ptr %t, align 4
  %or35 = or i32 %or34, %19
  %and36 = and i32 %or35, 255
  ret i32 %and36
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

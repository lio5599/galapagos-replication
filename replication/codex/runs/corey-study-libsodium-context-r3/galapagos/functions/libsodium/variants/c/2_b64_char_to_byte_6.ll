; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %d, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %a, align 4
  %sub3 = sub i32 25, %5
  %or = or i32 %4, %sub3
  %shr = lshr i32 %or, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  store i32 %xor, ptr %upper, align 4
  %6 = load i32, ptr %b, align 4
  %7 = load i32, ptr %b, align 4
  %sub4 = sub i32 25, %7
  %or5 = or i32 %6, %sub4
  %shr6 = lshr i32 %or5, 8
  %and7 = and i32 %shr6, 255
  %xor8 = xor i32 255, %and7
  store i32 %xor8, ptr %lower, align 4
  %8 = load i32, ptr %d, align 4
  %9 = load i32, ptr %d, align 4
  %sub9 = sub i32 9, %9
  %or10 = or i32 %8, %sub9
  %shr11 = lshr i32 %or10, 8
  %and12 = and i32 %shr11, 255
  %xor13 = xor i32 255, %and12
  store i32 %xor13, ptr %digit, align 4
  %10 = load i32, ptr %upper, align 4
  %11 = load i32, ptr %a, align 4
  %and14 = and i32 %10, %11
  %12 = load i32, ptr %lower, align 4
  %13 = load i32, ptr %b, align 4
  %add = add i32 %13, 26
  %and15 = and i32 %12, %add
  %or16 = or i32 %and14, %and15
  %14 = load i32, ptr %digit, align 4
  %15 = load i32, ptr %d, align 4
  %add17 = add i32 %15, 52
  %and18 = and i32 %14, %add17
  %or19 = or i32 %or16, %and18
  %16 = load i32, ptr %u, align 4
  %xor20 = xor i32 %16, 43
  %sub21 = sub i32 0, %xor20
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr22, 255
  %xor24 = xor i32 255, %and23
  %and25 = and i32 %xor24, 62
  %or26 = or i32 %or19, %and25
  %17 = load i32, ptr %u, align 4
  %xor27 = xor i32 %17, 47
  %sub28 = sub i32 0, %xor27
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %xor31 = xor i32 255, %and30
  %and32 = and i32 %xor31, 63
  %or33 = or i32 %or26, %and32
  store i32 %or33, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %19, 0
  %conv = zext i1 %cmp to i32
  %sub34 = sub i32 0, %conv
  %20 = load i32, ptr %u, align 4
  %xor35 = xor i32 %20, 65
  %sub36 = sub i32 0, %xor35
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %sub34, %shr37
  %and39 = and i32 %and38, 255
  %or40 = or i32 %18, %and39
  ret i32 %or40
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

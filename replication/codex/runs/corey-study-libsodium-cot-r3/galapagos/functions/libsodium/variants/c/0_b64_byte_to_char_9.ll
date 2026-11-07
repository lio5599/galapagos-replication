; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_9.c"
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
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %and = and i32 %0, 255
  store i32 %and, ptr %lo, align 4
  %1 = load i32, ptr %x.addr, align 4
  %shr = lshr i32 %1, 8
  store i32 %shr, ptr %hi, align 4
  %2 = load i32, ptr %hi, align 4
  %3 = load i32, ptr %lo, align 4
  %cmp = icmp ult i32 %3, 26
  %conv = zext i1 %cmp to i32
  %sub = sub i32 %2, %conv
  %and1 = and i32 %sub, 255
  store i32 %and1, ptr %a, align 4
  %4 = load i32, ptr %hi, align 4
  %5 = load i32, ptr %lo, align 4
  %cmp2 = icmp ult i32 %5, 52
  %conv3 = zext i1 %cmp2 to i32
  %sub4 = sub i32 %4, %conv3
  %and5 = and i32 %sub4, 255
  store i32 %and5, ptr %b, align 4
  %6 = load i32, ptr %hi, align 4
  %7 = load i32, ptr %lo, align 4
  %cmp6 = icmp ult i32 %7, 62
  %conv7 = zext i1 %cmp6 to i32
  %sub8 = sub i32 %6, %conv7
  %and9 = and i32 %sub8, 255
  store i32 %and9, ptr %c, align 4
  %8 = load i32, ptr %hi, align 4
  %sub10 = sub i32 0, %8
  %9 = load i32, ptr %lo, align 4
  %xor = xor i32 %9, 62
  %cmp11 = icmp ne i32 %xor, 0
  %conv12 = zext i1 %cmp11 to i32
  %sub13 = sub i32 %sub10, %conv12
  %and14 = and i32 %sub13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %d, align 4
  %10 = load i32, ptr %hi, align 4
  %sub16 = sub i32 0, %10
  %11 = load i32, ptr %lo, align 4
  %xor17 = xor i32 %11, 63
  %cmp18 = icmp ne i32 %xor17, 0
  %conv19 = zext i1 %cmp18 to i32
  %sub20 = sub i32 %sub16, %conv19
  %and21 = and i32 %sub20, 255
  %xor22 = xor i32 %and21, 255
  store i32 %xor22, ptr %e, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %x.addr, align 4
  %add = add i32 %13, 65
  %and23 = and i32 %12, %add
  %14 = load i32, ptr %a, align 4
  %xor24 = xor i32 %14, 255
  %15 = load i32, ptr %b, align 4
  %and25 = and i32 %xor24, %15
  %16 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %16, 71
  %and27 = and i32 %and25, %add26
  %or = or i32 %and23, %and27
  %17 = load i32, ptr %b, align 4
  %xor28 = xor i32 %17, 255
  %18 = load i32, ptr %c, align 4
  %and29 = and i32 %xor28, %18
  %19 = load i32, ptr %x.addr, align 4
  %add30 = add i32 %19, -4
  %and31 = and i32 %and29, %add30
  %or32 = or i32 %or, %and31
  %20 = load i32, ptr %d, align 4
  %and33 = and i32 %20, 43
  %or34 = or i32 %or32, %and33
  %21 = load i32, ptr %e, align 4
  %and35 = and i32 %21, 47
  %or36 = or i32 %or34, %and35
  ret i32 %or36
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

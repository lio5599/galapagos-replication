; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %dash = alloca i32, align 4
  %underscore = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 %xor, 1
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 %xor7, 1
  %shr9 = lshr i32 %sub8, 8
  store i32 %shr9, ptr %e, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  %and = and i32 %add, 255
  store i32 %and, ptr %upper, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add10 = add i32 %6, 71
  %and11 = and i32 %add10, 255
  store i32 %and11, ptr %lower, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %7, -4
  %and13 = and i32 %add12, 255
  store i32 %and13, ptr %digit, align 4
  store i32 45, ptr %dash, align 4
  store i32 95, ptr %underscore, align 4
  %8 = load i32, ptr %upper, align 4
  %9 = load i32, ptr %a, align 4
  %and14 = and i32 %8, %9
  %10 = load i32, ptr %lower, align 4
  %11 = load i32, ptr %b, align 4
  %and15 = and i32 %10, %11
  %12 = load i32, ptr %a, align 4
  %not = xor i32 %12, -1
  %and16 = and i32 %and15, %not
  %or = or i32 %and14, %and16
  %13 = load i32, ptr %digit, align 4
  %14 = load i32, ptr %c, align 4
  %and17 = and i32 %13, %14
  %15 = load i32, ptr %b, align 4
  %not18 = xor i32 %15, -1
  %and19 = and i32 %and17, %not18
  %or20 = or i32 %or, %and19
  %16 = load i32, ptr %dash, align 4
  %17 = load i32, ptr %d, align 4
  %and21 = and i32 %16, %17
  %or22 = or i32 %or20, %and21
  %18 = load i32, ptr %underscore, align 4
  %19 = load i32, ptr %e, align 4
  %and23 = and i32 %18, %19
  %or24 = or i32 %or22, %and23
  ret i32 %or24
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

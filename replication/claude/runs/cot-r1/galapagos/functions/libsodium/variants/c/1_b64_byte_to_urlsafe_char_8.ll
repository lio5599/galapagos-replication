; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.c"
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
  %m1 = alloca i32, align 4
  %m2 = alloca i32, align 4
  %m3 = alloca i32, align 4
  %m4 = alloca i32, align 4
  %m5 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %cmp = icmp ult i32 %0, 26
  %conv = zext i1 %cmp to i32
  %sub = sub i32 0, %conv
  store i32 %sub, ptr %m1, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 26
  %cmp2 = icmp ult i32 %sub1, 26
  %conv3 = zext i1 %cmp2 to i32
  %sub4 = sub i32 0, %conv3
  store i32 %sub4, ptr %m2, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %2, 52
  %cmp6 = icmp ult i32 %sub5, 10
  %conv7 = zext i1 %cmp6 to i32
  %sub8 = sub i32 0, %conv7
  store i32 %sub8, ptr %m3, align 4
  %3 = load i32, ptr %x.addr, align 4
  %cmp9 = icmp eq i32 %3, 62
  %conv10 = zext i1 %cmp9 to i32
  %sub11 = sub i32 0, %conv10
  store i32 %sub11, ptr %m4, align 4
  %4 = load i32, ptr %x.addr, align 4
  %cmp12 = icmp eq i32 %4, 63
  %conv13 = zext i1 %cmp12 to i32
  %sub14 = sub i32 0, %conv13
  store i32 %sub14, ptr %m5, align 4
  %5 = load i32, ptr %m1, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %5, %add
  %7 = load i32, ptr %m2, align 4
  %8 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %8, 71
  %and16 = and i32 %7, %add15
  %or = or i32 %and, %and16
  %9 = load i32, ptr %m3, align 4
  %10 = load i32, ptr %x.addr, align 4
  %sub17 = sub i32 %10, 4
  %and18 = and i32 %9, %sub17
  %or19 = or i32 %or, %and18
  %11 = load i32, ptr %m4, align 4
  %and20 = and i32 %11, 45
  %or21 = or i32 %or19, %and20
  %12 = load i32, ptr %m5, align 4
  %and22 = and i32 %12, 95
  %or23 = or i32 %or21, %and22
  ret i32 %or23
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
